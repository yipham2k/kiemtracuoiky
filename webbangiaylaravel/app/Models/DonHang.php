<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DonHang extends Model
{
    use HasFactory;

    protected $table = 'don_hang';
    protected $primaryKey = 'id_don_hang';
    public $timestamps = true;

    // Các trường được phép mass assignment
    protected $fillable = [
        'user_id',
        'ten_nguoi_nhan',
        'sdt',
        'dia_chi_nhan',
        'ghi_chu',
        'hinh_thuc_thanh_toan',
        'trang_thai_thanh_toan',
        'tong_tien',
        'trang_thai',
        'hoa_don',        // <-- thêm hoa_don để DonHang::create(...) không bị lỗi
        'duyet_by',       // nếu bạn dùng
        'duyet_at',       // nếu bạn dùng
    ];

    // Casts để Eloquent tự chuyển kiểu
    protected $casts = [
        'hoa_don'   => 'array',     // rất hữu ích: $donhang->hoa_don trả về array
        'tong_tien' => 'integer',   // hoặc 'float' tuỳ cách bạn lưu
        'duyet_at'  => 'datetime',
    ];

    // Nếu bạn muốn trả về int cho primary key
    protected $keyType = 'int';
    public $incrementing = true;

    // Trạng thái đơn hàng (key => label)
    public const STATUS_CHOICES = [
        'cho_duyet' => 'Chờ duyệt',
        'dang_giao' => 'Đang giao',
        'da_giao'   => 'Đã giao',
        'huy_don'   => 'Huỷ đơn hàng',
    ];

    public static function getStatusLabel($key)
    {
        return self::STATUS_CHOICES[$key] ?? $key;
    }

    // Thuộc tính ảo để lấy label
    public function getTrangThaiLabelAttribute()
    {
        $key = $this->attributes['trang_thai'] ?? null;
        return self::getStatusLabel($key);
    }

    /**
     * (Tùy chọn) Mutator để chuẩn hoá khi set trang_thai từ nhiều dạng input (label hoặc key).
     * Ví dụ: nếu bạn gửi 'Chờ duyệt' hay 'cho_duyet' đều lưu về key 'cho_duyet'.
     */
    public function setTrangThaiAttribute($value)
    {
        if ($value === null) {
            $this->attributes['trang_thai'] = null;
            return;
        }

        $val = trim(mb_strtolower((string)$value, 'UTF-8'));

        // map label -> key
        $map = array_change_key_case(self::STATUS_CHOICES, CASE_LOWER); // label lower => label
        // tìm key bằng so sánh label
        foreach (self::STATUS_CHOICES as $k => $label) {
            if (mb_strtolower($label, 'UTF-8') === $val || $k === $val) {
                $this->attributes['trang_thai'] = $k;
                return;
            }
        }

        // fallback: giữ nguyên value (hoặc set mặc định)
        $this->attributes['trang_thai'] = $val;
    }
}
