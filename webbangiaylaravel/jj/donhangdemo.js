const DonHang = initDonHangClass();

function main() {
    const dh = new DonHang();
    dh.setTrangThai(DonHang.flagCheck.CHUA_THANH_TOAN);
    dh.setTrangThai(DonHang.flagCheck.DANG_XU_LY);
    console.log(
        "Chua thanh toan:",
        dh.checkTrangThai(DonHang.flagCheck.CHUA_THANH_TOAN)
    ); // true
    console.log(
        "Da thanh toan:",
        dh.checkTrangThai(DonHang.flagCheck.DA_THANH_TOAN)
    ); // false
    console.log("Dang xu ly:", dh.checkTrangThai(DonHang.flagCheck.DANG_XU_LY)); // true
    dh.setTrangThai(DonHang.flagCheck.CHUA_THANH_TOAN, false);
    console.log(
        "Chua thanh toan:",
        dh.checkTrangThai(DonHang.flagCheck.CHUA_THANH_TOAN)
    ); // false
}

function initDonHangClass() {
    const nextFlag = () => 1 << ++flagInc;
    let flagInc = -1;

    return class {
        static flagCheck = {
            DA_THANH_TOAN: nextFlag(),
            CHUA_THANH_TOAN: nextFlag(),
            DON_BI_HUY: nextFlag(),
            THANH_TOAN_TIEN_MAT: nextFlag(),
            THANH_TOAN_CHUYEN_KHOAN: nextFlag(),
            DA_GIAO_HANG: nextFlag(),
            DANG_XU_LY: nextFlag(),
            DANG_GIAO_HANG: nextFlag(),
        };
        flagTrangThai = 0;
        checkTrangThai(flag) {
            return (this.flagTrangThai & flag) === flag;
        }
        setTrangThai(flag, isEnable = true) {
            if (isEnable) {
                this.flagTrangThai |= flag;
            } else {
                this.flagTrangThai &= ~flag;
            }
        }
    };
}

main();
