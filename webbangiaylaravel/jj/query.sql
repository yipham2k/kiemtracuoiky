SELECT id, flags, BIN(flags) AS bin_flags
FROM users
WHERE flags & 2 != 0;

$users = DB::table('users')
    ->whereRaw('(flags & :mask) = :mask', ['mask' => DON_HANG.FLAGS.DA_THANH_TOAN])
    ->get();