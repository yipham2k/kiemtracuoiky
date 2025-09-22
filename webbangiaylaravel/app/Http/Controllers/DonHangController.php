<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Redirect;

use App\Models\User;
use App\Models\Giay;
use App\Models\LoaiGiay;
use App\Models\ThuongHieu;
use App\Models\KhuyenMai;
use App\Models\GioHang;
use App\Models\PhanQuyen;
use App\Models\DonHang;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class DonHangController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if (session()->get('check') == 0) {
            return view('auth.login');
        } else {
            $data = User::where('id', session('DangNhap'))->first();
            $thuonghieus = ThuongHieu::all();
            $loaigiays = LoaiGiay::all();
            $giays = Giay::all();
            $users = User::all();
            $phanquyens = PhanQuyen::all();
            $khuyenmais = KhuyenMai::all();

            $giohangs = session()->get('gio_hang');
            if (!$giohangs) {
                $giohangs = array();
            }

            return view('index')->with('route', 'thanh-toan')
                ->with('data', $data)
                ->with('thuonghieus', $thuonghieus)
                ->with('loaigiays', $loaigiays)
                ->with('giays', $giays)
                ->with('users', $users)
                ->with('phanquyens', $phanquyens)
                ->with('khuyenmais', $khuyenmais)
                ->with('giohangs', $giohangs)
            ;
        }
    }

    public function thanhtoan(Request $request)
    {

        $giohangs = session()->get('gio_hang');
        if (!$giohangs) {
            $giohangs = array();
        }

        $thanhtoans = array();

        $check_gio_hangs = $request->input('check-gio-hang');
        foreach ($check_gio_hangs as $check_gio_hang) {
            foreach ($giohangs as $id => $giohang) {
                if ($check_gio_hang == $id) {
                    $thanhtoans[$id] = $giohang;
                }
            }
        }

        if (session()->get('check') == 0) {
            return view('auth.login');
        } else {
            $data = User::where('id', session('DangNhap'))->first();
            $thuonghieus = ThuongHieu::all();
            $loaigiays = LoaiGiay::all();
            $giays = Giay::all();
            $users = User::all();
            $phanquyens = PhanQuyen::all();
            $khuyenmais = KhuyenMai::all();

            return view('index')->with('route', 'thanh-toan')
                ->with('data', $data)
                ->with('thuonghieus', $thuonghieus)
                ->with('loaigiays', $loaigiays)
                ->with('giays', $giays)
                ->with('users', $users)
                ->with('phanquyens', $phanquyens)
                ->with('khuyenmais', $khuyenmais)
                ->with('giohangs', $thanhtoans)
            ;
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $giohangs = session()->get('gio_hang') ?? [];
        $user = session('DangNhap');

        $donhang = DonHang::create([
            'user_id' => session('DangNhap'), // bắt buộc phải có user_id
            'ten_nguoi_nhan' => $request->ten_nguoi_nhan,
            'sdt' => $request->sdt,
            'dia_chi_nhan' => $request->dia_chi_nhan,
            'ghi_chu' => $request->ghi_chu ?? '',
            'tong_tien' => $request->tong_tien,
            'hoa_don' => $request->input('thanh_toans') ?? '[]',
            'hinh_thuc_thanh_toan' => $request->hinh_thuc_thanh_toan,
        ]);


        // $danh_gias = $request->input('thanh_toans');
        $danh_gias = session()->get('danh_gias');
        if (!$danh_gias) {
            $danh_gias = array();
        }

        $oks = json_decode($request->input('thanh_toans'), true);  // <= chỗ bạn đang hỏi

        foreach ($oks as $id => $ok) {
            $danh_gias[$id] = $ok;
            $giay = Giay::find($id);
            $giay['so_luong_mua'] = $giay['so_luong_mua'] + 1;
            $giay->save();
        }
        session()->put('danh_gias', $danh_gias);

        // Xoá các sản phẩm đã thanh toán khỏi giỏ hàng
        foreach ($danh_gias as $iddg => $danh_gia) {
            foreach ($giohangs as $idgh => $giohang) {
                if ($idgh == $iddg) {
                    unset($giohangs[$idgh]);
                }
            }
        }

        session()->put('gio_hang', $giohangs);

        return Redirect('/');
    }


    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $data = User::where('id', session('DangNhap'))->first();
        $thuonghieus = ThuongHieu::all();
        $loaigiays = LoaiGiay::all();
        $giays = Giay::all();
        $users = User::all();
        $phanquyens = PhanQuyen::all();
        $khuyenmais = KhuyenMai::all();
        $donhang = DonHang::find($id);

        $giohangs = session()->get('gio_hang');

        return view('admin.donhang.xem')
            ->with('data', $data)
            ->with('thuonghieus', $thuonghieus)
            ->with('loaigiays', $loaigiays)
            ->with('giays', $giays)
            ->with('users', $users)
            ->with('phanquyens', $phanquyens)
            ->with('khuyenmais', $khuyenmais)
            ->with('donhang', $donhang)
        ;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
        $data = DonHang::find($id);
        $data->delete();
        return Redirect('/admin/donhang');
    }



    public function duyetDonHang(Request $request, $id)
    {
        $donhang = DonHang::findOrFail($id);

        $items = $request->input('giay') ?? json_decode($donhang->hoa_don, true);

        $list = [];

        if (is_array($items)) {
            $keys = array_keys($items);
            $isSequential = ($keys === range(0, count($items) - 1));

            if ($isSequential) {
                foreach ($items as $giay) {
                    if (is_object($giay)) $giay = (array) $giay;
                    $idGiay = isset($giay['id']) ? (int)$giay['id'] : null;
                    $qty = isset($giay['qty']) ? (int)$giay['qty'] : (int)($giay['so_luong'] ?? 1);
                    if ($idGiay) $list[] = ['id' => $idGiay, 'qty' => max(1, $qty)];
                }
            } else {
                foreach ($items as $key => $entry) {
                    $idGiay = (int)$key;
                    if (is_object($entry)) $entry = (array)$entry;
                    $qty = isset($entry['so_luong']) ? (int)$entry['so_luong'] : (int)($entry['qty'] ?? 1);
                    $list[] = ['id' => $idGiay, 'qty' => max(1, $qty)];
                }
            }
        }

        if (empty($list)) {
            return redirect()->back()->with('error', 'Không có sản phẩm để duyệt trong đơn.');
        }

        // Xử lý trạng thái
        $input = (string) $request->input('trang_thai', '');
        $inputTrim = trim(mb_strtolower($input, 'UTF-8'));
        $map = [
            'chờ duyệt' => 'cho_duyet',
            'cho_duyet' => 'cho_duyet',
            'cho duyet' => 'cho_duyet',
            'cho-duyet' => 'cho_duyet',
            'đang giao' => 'dang_giao',
            'dang_giao' => 'dang_giao',
            'dang giao' => 'dang_giao',
            'đã giao' => 'da_giao',
            'da_giao' => 'da_giao',
            'da giao' => 'da_giao',
            'hủy đơn' => 'huy_don',
            'huỷ đơn' => 'huy_don',
            'huy don' => 'huy_don',
            'huy_don' => 'huy_don',
            'huy-don' => 'huy_don',
        ];
        $newStatus = $map[$inputTrim] ?? $inputTrim;
        $allowedKeys = ['cho_duyet', 'dang_giao', 'da_giao', 'huy_don'];
        if (!in_array($newStatus, $allowedKeys)) $newStatus = 'cho_duyet';

        DB::transaction(function () use ($donhang, $list, $newStatus) {

            if ($newStatus === 'huy_don') {
                // Huỷ đơn: trả sản phẩm về giỏ hàng
                $giohangs = session()->get('gio_hang') ?? [];

                foreach ($list as $giay) {
                    $idGiay = $giay['id'];
                    $qty = $giay['qty'];

                    $shoe = Giay::find($idGiay);
                    if (!$shoe) continue;

                    if (isset($giohangs[$idGiay])) {
                        $giohangs[$idGiay]['so_luong'] += $qty;
                    } else {
                        $giohangs[$idGiay] = [
                            'id' => $shoe->id,
                            'ten_giay' => $shoe->ten_giay,
                            'don_gia' => $shoe->don_gia,
                            'so_luong' => $qty,
                            'hinh_anh_1' => $shoe->hinh_anh_1, // lấy từ DB, không dùng ảnh cứng
                        ];
                    }
                }

                session()->put('gio_hang', $giohangs);
            } else {
                // Duyệt bình thường: giảm số lượng sản phẩm
                foreach ($list as $giay) {
                    $shoe = Giay::find($giay['id']);
                    if (!$shoe) continue;

                    $qty = (int)($giay['qty'] ?? 1);

                    if (array_key_exists('so_luong', $shoe->getAttributes())) {
                        $shoe->so_luong = max(0, $shoe->so_luong - $qty);
                    }

                    if (array_key_exists('so_luot_duyet', $shoe->getAttributes())) {
                        $shoe->so_luot_duyet = ($shoe->so_luot_duyet ?? 0) + $qty;
                    }

                    $shoe->save();
                }
            }

            // Cập nhật trạng thái đơn
            $donhang->trang_thai = $newStatus;

            if (array_key_exists('duyet_by', $donhang->getAttributes())) {
                $donhang->duyet_by = session('DangNhap') ?? null;
            }
            if (array_key_exists('duyet_at', $donhang->getAttributes())) {
                $donhang->duyet_at = Carbon::now();
            }

            $donhang->save();
        });

        if ($newStatus === 'huy_don') {
            return redirect()->back()->with('success', 'Đơn hàng đã bị huỷ, sản phẩm đã trả về giỏ hàng.');
        } else {
            return redirect()->back()->with('success', 'Duyệt đơn thành công.');
        }
    }



    public function xem(int $id, Request $req)
    {
        $donhang = DonHang::find($id);
        // dd($donhang);
        // dd(route('donhang.duyet', ['id' => $donhang->id_don_hang]));
        return view('admin.donhang.xem', compact('donhang'));
    }
}
