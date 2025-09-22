@extends('admin.index')

@section('admin_content')
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h4 class="" style="margin-top: 10px">
                <strong>XEM CHI TIẾT ĐƠN HÀNG</strong>&ensp;
                <i class="fas fa-cart-arrow-down"></i>
            </h4>
        </div>

        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th scope="col">Tên giày</th>
                            <th scope="col">Đơn giá</th>
                            <th scope="col">Số lượng</th>
                            <th scope="col">Thành tiền</th>
                        </tr>
                    </thead>
                    <tbody>
                        @php
                            // Nếu hoa_don là JSON string, decode ra mảng
                            $sanphams = [];
                            if (!empty($donhang?->hoa_don)) {
                                $sanphams = json_decode($donhang->hoa_don, true); // true để ra mảng
                                if (!is_array($sanphams)) {
                                    $sanphams = []; // fallback nếu JSON không hợp lệ
                                }
                            }
                        @endphp

                        @if (!empty($sanphams))
                            @foreach ($sanphams as $sp)
                                <tr>
                                    <td scope="row">{{ $sp['ten_giay'] }}</td>
                                    <td>{{ number_format($sp['don_gia']) }} VNĐ</td>
                                    <td>{{ $sp['so_luong'] }}</td>
                                    <td>{{ number_format($sp['don_gia'] * $sp['so_luong']) }} VNĐ</td>
                                </tr>
                            @endforeach
                        @else
                            <tr>
                                <td colspan="4">Không có sản phẩm nào.</td>
                            </tr>
                        @endif

                    </tbody>
                </table>

                <script>
                    $(document).ready(function() {
                        $('#dataTable').DataTable();
                    });
                </script>
            </div>
        </div>

    </div>


    <div class="card shadow">
        <div class="card-header">
            <h5 class="card-title" style="margin-top: 10px">Tùy chỉnh:</h5>
        </div>

        <div class="card-body">
            @if ($donhang)
                <?php
                // lấy choices từ model
                $choices = \App\Models\DonHang::STATUS_CHOICES;
                
                // giá trị hiện tại trong DB (có thể là key như 'cho_duyet' hoặc label như 'Chờ duyệt')
                $currentRaw = $donhang->trang_thai ?? '';
                
                // nếu currentRaw là key (exists in keys) => currentKey = đó
                if (array_key_exists($currentRaw, $choices)) {
                    $currentKey = $currentRaw;
                } else {
                    // nếu currentRaw là label (exists in values) => tìm key tương ứng
                    $found = array_search($currentRaw, $choices, true);
                    $currentKey = $found !== false ? $found : null;
                }
                
                // fallback nếu không tìm đc
                if (!$currentKey) {
                    $currentKey = 'cho_duyet';
                }
                ?>

                @if ($currentKey === 'cho_duyet')
                    <form method="POST" action="{{ route('donhang.duyet', ['id' => $donhang->id_don_hang]) }}">
                        @csrf
                        <div class="form-group">
                            <label for="trang_thai">Trạng thái</label>
                            <select name="trang_thai" id="trang_thai" class="form-control">
                                @foreach (\App\Models\DonHang::STATUS_CHOICES as $key => $label)
                                    <option value="{{ $key }}"
                                        {{ $donhang->trang_thai === $key ? 'selected' : '' }}>{{ $label }}</option>
                                @endforeach
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary mt-2">Cập nhật</button>
                    </form>
                @else
                    <p><strong>Trạng thái đơn hàng:</strong> {{ \App\Models\DonHang::getStatusLabel($currentKey) }}</p>
                @endif
            @else
                <p>Đơn hàng không tồn tại.</p>
            @endif
        </div>

    </div>



    <br>
@endsection
