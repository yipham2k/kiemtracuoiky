<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddTrangThaiThanhToanV2ToDonHangTable extends Migration
{
    public function up()
    {
        // phòng trường hợp column đã tồn tại (tránh lỗi khi chạy nhiều lần)
        Schema::table('don_hang', function (Blueprint $table) {
            // Dùng string để tương thích, hoặc đổi thành enum nếu bạn muốn
            $table->enum('trang_thai_thanh_toan', ['chua_thanh_toan', 'da_thanh_toan', 'dang_cho'])
                ->default('chua_thanh_toan')
                ->after('trang_thai'); // đặt sau cột nào đó nếu cần
        });
    }

    public function down()
    {
        Schema::table('don_hang', function (Blueprint $table) {
            $table->dropColumn('trang_thai_thanh_toan');
        });
    }
}
