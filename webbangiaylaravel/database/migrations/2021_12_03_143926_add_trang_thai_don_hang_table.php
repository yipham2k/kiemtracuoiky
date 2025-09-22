<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;


class AddTrangThaiDonHangTable extends Migration
{
    public function up()
    {
        // 1) thêm cột tạm lưu giá trị cũ (nếu chưa có)
        Schema::table('don_hang', function (Blueprint $table) {
            if (!Schema::hasColumn('don_hang', 'old_trang_thai')) {
                $table->string('old_trang_thai')->nullable()->after('trang_thai');
            }
        });

        DB::statement('UPDATE `don_hang` SET `old_trang_thai` = `trang_thai`');

        // 2) đổi kiểu trang_thai sang ENUM an toàn
        DB::statement("ALTER TABLE `don_hang` 
            MODIFY `trang_thai` ENUM('cho_duyet','dang_giao','da_giao','huy_don') 
            NOT NULL DEFAULT 'cho_duyet'");

        // 3) map giá trị cũ -> key mới
        $mapping = [
            'chờ duyệt'    => 'cho_duyet',
            'cho_duyet'    => 'cho_duyet',
            'chờ_duyet'    => 'cho_duyet',
            'đang giao'    => 'dang_giao',
            'dang_giao'    => 'dang_giao',
            'đã giao'      => 'da_giao',
            'da_giao'      => 'da_giao',
            'Huỷ đơn hàng' => 'huy_don',
            'Hủy đơn hàng' => 'huy_don',
            'huy don'      => 'huy_don',
            'huy_don'      => 'huy_don',
        ];

        $rows = DB::table('don_hang')->select('id_don_hang', 'old_trang_thai')->get();
        foreach ($rows as $r) {
            $old = trim($r->old_trang_thai ?? '');
            $new = $mapping[$old] ?? 'cho_duyet';
            DB::table('don_hang')->where('id_don_hang', $r->id_don_hang)
                ->update(['trang_thai' => $new]);
        }

        // 4) xóa cột tạm
        Schema::table('don_hang', function (Blueprint $table) {
            if (Schema::hasColumn('don_hang', 'old_trang_thai')) {
                $table->dropColumn('old_trang_thai');
            }
        });
    }

    public function down()
    {
        // rollback: chuyển trang_thai thành varchar để tránh lỗi
        DB::statement("ALTER TABLE `don_hang` MODIFY `trang_thai` VARCHAR(255) NOT NULL DEFAULT 'cho_duyet'");
    }
}
