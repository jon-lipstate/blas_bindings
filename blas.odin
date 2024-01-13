package lapack

Index :: int
Layout :: enum i32 {
	Row_Major = 101,
	Col_Major = 102,
}
Transpose :: enum i32 {
	No_Trans   = 111,
	Trans      = 112,
	Conj_Trans = 113,
}
UpLo :: enum i32 {
	Upper = 121,
	Lower = 122,
}
Diag :: enum i32 {
	Non_Unit = 131,
	Unit     = 132,
}
Side :: enum i32 {
	Left  = 141,
	Right = 142,
}
@(require)
foreign import blas {"./librefblas.a", "./libcblas.a"}

@(default_calling_convention = "c", link_prefix = "cblas_")
foreign blas {
	// ===========================================================================
	// level 1 BLAS functions (complex are recast as routines)
	// ===========================================================================

	// Single and double precision absolute value functions
	dcabs1 :: proc(z: [^]complex128) -> f64 ---
	scabs1 :: proc(c: [^]complex64) -> f32 ---

	// Dot product and dot-related functions
	sdsdot :: proc(N: i32, alpha: f32, X: [^]f32, incX: i32, Y: [^]f32, incY: i32) -> f32 ---
	dsdot :: proc(N: i32, X: [^]f32, incX: i32, Y: [^]f32, incY: i32) -> f64 ---
	sdot :: proc(N: i32, X: [^]f32, incX: i32, Y: [^]f32, incY: i32) -> f32 ---
	ddot :: proc(N: i32, X: [^]f64, incX: i32, Y: [^]f64, incY: i32) -> f64 ---

	// Complex number dot product functions
	cdotu_sub :: proc(N: i32, X: [^]complex64, incX: i32, Y: [^]complex64, incY: i32, dotu: [^]complex64) ---
	cdotc_sub :: proc(N: i32, X: [^]complex64, incX: i32, Y: [^]complex64, incY: i32, dotc: [^]complex64) ---

	zdotu_sub :: proc(N: i32, X: [^]complex128, incX: i32, Y: [^]complex128, incY: i32, dotu: [^]complex128) ---
	zdotc_sub :: proc(N: i32, X: [^]complex128, incX: i32, Y: [^]complex128, incY: i32, dotc: [^]complex128) ---

	// Norm and sum functions
	snrm2 :: proc(N: i32, X: [^]f32, incX: i32) -> f32 ---
	sasum :: proc(N: i32, X: [^]f32, incX: i32) -> f32 ---

	dnrm2 :: proc(N: i32, X: [^]f64, incX: i32) -> f64 ---
	dasum :: proc(N: i32, X: [^]f64, incX: i32) -> f64 ---

	scnrm2 :: proc(N: i32, X: [^]complex64, incX: i32) -> f32 ---
	scasum :: proc(N: i32, X: [^]complex64, incX: i32) -> f32 ---

	dznrm2 :: proc(N: i32, X: [^]complex128, incX: i32) -> f64 ---
	dzasum :: proc(N: i32, X: [^]complex128, incX: i32) -> f64 ---

	// Index functions
	isamax :: proc(N: i32, X: [^]f32, incX: i32) -> Index ---
	idamax :: proc(N: i32, X: [^]f64, incX: i32) -> Index ---
	icamax :: proc(N: i32, X: [^]complex64, incX: i32) -> Index ---
	izamax :: proc(N: i32, X: [^]complex128, incX: i32) -> Index ---

	// ===========================================================================
	// Level 1 BLAS routines
	// ===========================================================================
	// Routines with standard 4 prefixes (s, d, c, z)
	sswap :: proc(N: i32, X, Y: [^]f32, incX, incY: i32) ---
	scopy :: proc(N: i32, X: [^]f32, incX: i32, Y: [^]f32, incY: i32) ---
	saxpy :: proc(N: i32, alpha: f32, X: [^]f32, incX: i32, Y: [^]f32, incY: i32) ---

	dswap :: proc(N: i32, X, Y: [^]f64, incX, incY: i32) ---
	dcopy :: proc(N: i32, X: [^]f64, incX: i32, Y: [^]f64, incY: i32) ---
	daxpy :: proc(N: i32, alpha: f64, X: [^]f64, incX: i32, Y: [^]f64, incY: i32) ---

	cswap :: proc(N: i32, X, Y: [^]complex64, incX, incY: i32) ---
	ccopy :: proc(N: i32, X: [^]complex64, incX: i32, Y: [^]complex64, incY: i32) ---
	caxpy :: proc(N: i32, alpha: complex64, X: [^]complex64, incX: i32, Y: [^]complex64, incY: i32) ---

	zswap :: proc(N: i32, X, Y: [^]complex128, incX, incY: i32) ---
	zcopy :: proc(N: i32, X: [^]complex128, incX: i32, Y: [^]complex128, incY: i32) ---
	zaxpy :: proc(N: i32, alpha: complex128, X: [^]complex128, incX: i32, Y: [^]complex128, incY: i32) ---

	// Routines with S and D prefix only
	srotmg :: proc(d1, d2, b1: [^]f32, b2: f32, P: [^]f32) ---
	srotm :: proc(N: i32, X: [^]f32, incX: i32, Y: [^]f32, incY: i32, P: [^]f32) ---
	drotmg :: proc(d1, d2, b1: [^]f64, b2: f64, P: [^]f64) ---
	drotm :: proc(N: i32, X: [^]f64, incX: i32, Y: [^]f64, incY: i32, P: [^]f64) ---

	// Routines with S D C Z CS and ZD prefixes
	sscal :: proc(N: i32, alpha: f32, X: [^]f32, incX: i32) ---
	dscal :: proc(N: i32, alpha: f64, X: [^]f64, incX: i32) ---
	cscal :: proc(N: i32, alpha: [^]complex64, X: [^]complex64, incX: i32) ---
	zscal :: proc(N: i32, alpha: [^]complex128, X: [^]complex128, incX: i32) ---
	csscal :: proc(N: i32, alpha: f32, X: [^]complex64, incX: i32) ---
	zdscal :: proc(N: i32, alpha: f64, X: [^]complex128, incX: i32) ---

	srotg :: proc(a, b, c, s: [^]f32) ---
	drotg :: proc(a, b, c, s: [^]f64) ---
	crotg :: proc(a, b: [^]complex64, c: [^]f32, s: [^]complex64) ---
	zrotg :: proc(a, b: [^]complex128, c: [^]f64, s: [^]complex128) ---

	srot :: proc(N: i32, X: [^]f32, incX: i32, Y: [^]f32, incY: i32, c, s: f32) ---
	drot :: proc(N: i32, X: [^]f64, incX: i32, Y: [^]f64, incY: i32, c, s: f64) ---
	csrot :: proc(N: i32, X, Y: [^]complex64, incX, incY: i32, c, s: f32) ---
	zdrot :: proc(N: i32, X, Y: [^]complex128, incX, incY: i32, c, s: f64) ---

	// ===========================================================================
	// Prototypes for level 2 BLAS (part 1)
	// ===========================================================================
	// Routines with standard 4 prefixes (S, D, C, Z)
	sgemv :: proc(layout: Layout, TransA: Transpose, M, N: i32, alpha: f32, A: [^]f32, lda: i32, X: [^]f32, incX: i32, beta: f32, Y: [^]f32, incY: i32) ---
	sgbmv :: proc(layout: Layout, TransA: Transpose, M, N: i32, KL, KU: i32, alpha: f32, A: [^]f32, lda: i32, X: [^]f32, incX: i32, beta: f32, Y: [^]f32, incY: i32) ---
	strmv :: proc(layout: Layout, Uplo: UpLo, TransA: Transpose, Diag: i32, N: i32, A: [^]f32, lda: i32, X: [^]f32, incX: i32) ---
	stbmv :: proc(layout: Layout, Uplo: UpLo, TransA: Transpose, Diag: i32, N, K: i32, A: [^]f32, lda: i32, X: [^]f32, incX: i32) ---
	stpmv :: proc(layout: Layout, Uplo: UpLo, TransA: Transpose, Diag: i32, N: i32, Ap: [^]f32, X: [^]f32, incX: i32) ---
	strsv :: proc(layout: Layout, Uplo: UpLo, TransA: Transpose, Diag: i32, N: i32, A: [^]f32, lda: i32, X: [^]f32, incX: i32) ---
	stbsv :: proc(layout: Layout, Uplo: UpLo, TransA: Transpose, Diag: i32, N, K: i32, A: [^]f32, lda: i32, X: [^]f32, incX: i32) ---
	stpsv :: proc(layout: Layout, Uplo: UpLo, TransA: Transpose, Diag: i32, N: i32, Ap: [^]f32, X: [^]f32, incX: i32) ---

	dgemv :: proc(layout: Layout, TransA: Transpose, M, N: i32, alpha: f64, A: [^]f64, lda: i32, X: [^]f64, incX: i32, beta: f64, Y: [^]f64, incY: i32) ---
	dgbmv :: proc(layout: Layout, TransA: Transpose, M, N, KL, KU: i32, alpha: f64, A: [^]f64, lda: i32, X: [^]f64, incX: i32, beta: f64, Y: [^]f64, incY: i32) ---
	dtrmv :: proc(layout: Layout, Uplo: UpLo, TransA: Transpose, Diag: i32, N: i32, A: [^]f64, lda: i32, X: [^]f64, incX: i32) ---
	dtbmv :: proc(layout: Layout, Uplo: UpLo, TransA: Transpose, Diag: i32, N, K: i32, A: [^]f64, lda: i32, X: [^]f64, incX: i32) ---
	dtpmv :: proc(layout: Layout, Uplo: UpLo, TransA: Transpose, Diag: i32, N: i32, Ap: [^]f64, X: [^]f64, incX: i32) ---
	dtrsv :: proc(layout: Layout, Uplo: UpLo, TransA: Transpose, Diag: i32, N: i32, A: [^]f64, lda: i32, X: [^]f64, incX: i32) ---
	dtbsv :: proc(layout: Layout, Uplo: UpLo, TransA: Transpose, Diag: i32, N, K: i32, A: [^]f64, lda: i32, X: [^]f64, incX: i32) ---
	dtpsv :: proc(layout: Layout, Uplo: UpLo, TransA: Transpose, Diag: i32, N: i32, Ap: [^]f64, X: [^]f64, incX: i32) ---

	cgemv :: proc(layout: i32, TransA: i32, M, N: i32, alpha: [^]complex64, A: [^]complex64, lda: i32, X: [^]complex64, incX: i32, beta: [^]complex64, Y: [^]complex64, incY: i32) ---
	cgbmv :: proc(layout: i32, TransA: i32, M, N, KL, KU: i32, alpha: [^]complex64, A: [^]complex64, lda: i32, X: [^]complex64, incX: i32, beta: [^]complex64, Y: [^]complex64, incY: i32) ---
	ctrmv :: proc(layout: Layout, Uplo: UpLo, TransA: Transpose, Diag: i32, N: i32, A: [^]complex64, lda: i32, X: [^]complex64, incX: i32) ---
	ctbmv :: proc(layout: Layout, Uplo: UpLo, TransA: Transpose, Diag: i32, N, K: i32, A: [^]complex64, lda: i32, X: [^]complex64, incX: i32) ---
	ctpmv :: proc(layout: Layout, Uplo: UpLo, TransA: Transpose, Diag: i32, N: i32, Ap: [^]complex64, X: [^]complex64, incX: i32) ---
	ctrsv :: proc(layout: Layout, Uplo: UpLo, TransA: Transpose, Diag: i32, N: i32, A: [^]complex64, lda: i32, X: [^]complex64, incX: i32) ---
	ctbsv :: proc(layout: Layout, Uplo: UpLo, TransA: Transpose, Diag: i32, N, K: i32, A: [^]complex64, lda: i32, X: [^]complex64, incX: i32) ---
	ctpsv :: proc(layout: Layout, Uplo: UpLo, TransA: Transpose, Diag: i32, N: i32, Ap: [^]complex64, X: [^]complex64, incX: i32) ---

	zgemv :: proc(layout: Layout, TransA: Transpose, M, N: i32, alpha: [^]complex128, A: [^]complex128, lda: i32, X: [^]complex128, incX: i32, beta: [^]complex128, Y: [^]complex128, incY: i32) ---
	zgbmv :: proc(layout: Layout, TransA: Transpose, M, N, KL, KU: i32, alpha: [^]complex128, A: [^]complex128, lda: i32, X: [^]complex128, incX: i32, beta: [^]complex128, Y: [^]complex128, incY: i32) ---
	ztrmv :: proc(layout: Layout, Uplo: UpLo, TransA: Transpose, Diag: i32, N: i32, A: [^]complex128, lda: i32, X: [^]complex128, incX: i32) ---
	ztbmv :: proc(layout: Layout, Uplo: UpLo, TransA: Transpose, Diag: Diag, N, K: i32, A: [^]complex128, lda: i32, X: [^]complex128, incX: i32) ---
	ztpmv :: proc(layout: Layout, Uplo: UpLo, TransA: Transpose, Diag: Diag, N: i32, Ap: [^]complex128, X: [^]complex128, incX: i32) ---
	ztrsv :: proc(layout: Layout, Uplo: UpLo, TransA: Transpose, Diag: Diag, N: i32, A: [^]complex128, lda: i32, X: [^]complex128, incX: i32) ---
	ztbsv :: proc(layout: Layout, Uplo: UpLo, TransA: Transpose, Diag: Diag, N, K: i32, A: [^]complex128, lda: i32, X: [^]complex128, incX: i32) ---
	ztpsv :: proc(layout: Layout, Uplo: UpLo, TransA: Transpose, Diag: Diag, N: i32, Ap: [^]complex128, X: [^]complex128, incX: i32) ---

	// Routines with S and D prefixes only
	ssymv :: proc(layout: Layout, Uplo: UpLo, N: i32, alpha: f32, A: [^]f32, lda: i32, X: [^]f32, incX: i32, beta: f32, Y: [^]f32, incY: i32) ---
	ssbmv :: proc(layout: Layout, Uplo: UpLo, N, K: i32, alpha: f32, A: [^]f32, lda: i32, X: [^]f32, incX: i32, beta: f32, Y: [^]f32, incY: i32) ---
	sspmv :: proc(layout: Layout, Uplo: UpLo, N: i32, alpha: f32, Ap: [^]f32, X: [^]f32, incX: i32, beta: f32, Y: [^]f32, incY: i32) ---
	sger :: proc(layout: Layout, M, N: i32, alpha: f32, X: [^]f32, incX: i32, Y: [^]f32, incY: i32, A: [^]f32, lda: i32) ---
	ssyr :: proc(layout: Layout, Uplo: UpLo, N: i32, alpha: f32, X: [^]f32, incX: i32, A: [^]f32, lda: i32) ---
	sspr :: proc(layout: Layout, Uplo: UpLo, N: i32, alpha: f32, X: [^]f32, incX: i32, Ap: [^]f32) ---
	ssyr2 :: proc(layout: Layout, Uplo: UpLo, N: i32, alpha: f32, X: [^]f32, incX: i32, Y: [^]f32, incY: i32, A: [^]f32, lda: i32) ---
	sspr2 :: proc(layout: Layout, Uplo: UpLo, N: i32, alpha: f32, X: [^]f32, incX: i32, Y: [^]f32, incY: i32, A: [^]f32) ---
	dsymv :: proc(layout: Layout, Uplo: UpLo, N: i32, alpha: f64, A: [^]f64, lda: i32, X: [^]f64, incX: i32, beta: f64, Y: [^]f64, incY: i32) ---
	dsbmv :: proc(layout: Layout, Uplo: UpLo, N, K: i32, alpha: f64, A: [^]f64, lda: i32, X: [^]f64, incX: i32, beta: f64, Y: [^]f64, incY: i32) ---
	dspmv :: proc(layout: Layout, Uplo: UpLo, N: i32, alpha: f64, Ap: [^]f64, X: [^]f64, incX: i32, beta: f64, Y: [^]f64, incY: i32) ---
	dger :: proc(layout: Layout, M, N: i32, alpha: f64, X: [^]f64, incX: i32, Y: [^]f64, incY: i32, A: [^]f64, lda: i32) ---
	dsyr :: proc(layout: Layout, Uplo: UpLo, N: i32, alpha: f64, X: [^]f64, incX: i32, A: [^]f64, lda: i32) ---
	dspr :: proc(layout: Layout, Uplo: UpLo, N: i32, alpha: f64, X: [^]f64, incX: i32, Ap: [^]f64) ---
	dsyr2 :: proc(layout: Layout, Uplo: UpLo, N: i32, alpha: f64, X: [^]f64, incX: i32, Y: [^]f64, incY: i32, A: [^]f64, lda: i32) ---
	dspr2 :: proc(layout: Layout, Uplo: UpLo, N: i32, alpha: f64, X: [^]f64, incX: i32, Y: [^]f64, incY: i32, A: [^]f64) ---

	chemv :: proc(layout: Layout, Uplo: UpLo, N: i32, alpha: [^]complex64, A: [^]complex64, lda: i32, X: [^]complex64, incX: i32, beta: [^]complex64, Y: [^]complex64, incY: i32) ---
	chbmv :: proc(layout: Layout, Uplo: UpLo, N, K: i32, alpha: [^]complex64, A: [^]complex64, lda: i32, X: [^]complex64, incX: i32, beta: [^]complex64, Y: [^]complex64, incY: i32) ---
	chpmv :: proc(layout: Layout, Uplo: UpLo, N: i32, alpha: [^]complex64, Ap: [^]complex64, X: [^]complex64, incX: i32, beta: [^]complex64, Y: [^]complex64, incY: i32) ---
	cgeru :: proc(layout: Layout, M, N: i32, alpha: [^]complex64, X: [^]complex64, incX: i32, Y: [^]complex64, incY: i32, A: [^]complex64, lda: i32) ---
	cgerc :: proc(layout: Layout, M, N: i32, alpha: [^]complex64, X: [^]complex64, incX: i32, Y: [^]complex64, incY: i32, A: [^]complex64, lda: i32) ---
	ssymm :: proc(layout: Layout, Side: Side, Uplo: UpLo, M, N: i32, alpha: f32, A: [^]f32, lda: i32, B: [^]f32, ldb: i32, beta: f32, C: [^]f32, ldc: i32) ---
	ssyrk :: proc(layout: Layout, Uplo: UpLo, Trans: Transpose, N, K: i32, alpha: f32, A: [^]f32, lda: i32, beta: f32, C: [^]f32, ldc: i32) ---
	ssyr2k :: proc(layout: Layout, Uplo: UpLo, Trans: Transpose, N, K: i32, alpha: f32, A: [^]f32, lda: i32, B: [^]f32, ldb: i32, beta: f32, C: [^]f32, ldc: i32) ---
	strmm :: proc(layout: Layout, Side: Side, Uplo: UpLo, TransA: Transpose, Diag: Diag, M, N: i32, alpha: f32, A: [^]f32, lda: i32, B: [^]f32, ldb: i32) ---
	strsm :: proc(layout: Layout, Side: Side, Uplo: UpLo, TransA: Transpose, Diag: Diag, M, N: i32, alpha: f32, A: [^]f32, lda: i32, B: [^]f32, ldb: i32) ---

	dgemm :: proc(layout: Layout, TransA: Transpose, TransB: Transpose, M, N, K: i32, alpha: f64, A: [^]f64, lda: i32, B: [^]f64, ldb: i32, beta: f64, C: [^]f64, ldc: i32) ---
	dsymm :: proc(layout: Layout, Side: Side, Uplo: UpLo, M, N: i32, alpha: f64, A: [^]f64, lda: i32, B: [^]f64, ldb: i32, beta: f64, C: [^]f64, ldc: i32) ---
	dsyrk :: proc(layout: Layout, Uplo: UpLo, Trans: Transpose, N, K: i32, alpha: f64, A: [^]f64, lda: i32, beta: f64, C: [^]f64, ldc: i32) ---
	dsyr2k :: proc(layout: Layout, Uplo: UpLo, Trans: Transpose, N, K: i32, alpha: f64, A: [^]f64, lda: i32, B: [^]f64, ldb: i32, beta: f64, C: [^]f64, ldc: i32) ---
	dtrmm :: proc(layout: Layout, Side: Side, Uplo: UpLo, TransA: Transpose, Diag: Diag, M, N: i32, alpha: f64, A: [^]f64, lda: i32, B: [^]f64, ldb: i32) ---
	dtrsm :: proc(layout: Layout, Side: Side, Uplo: UpLo, TransA: Transpose, Diag: Diag, M, N: i32, alpha: f64, A: [^]f64, lda: i32, B: [^]f64, ldb: i32) ---
	cgemm :: proc(layout: Layout, TransA: Transpose, TransB: Transpose, M, N, K: i32, alpha: [^]complex64, A: [^]complex64, lda: i32, B: [^]complex64, ldb: i32, beta: [^]complex64, C: [^]complex64, ldc: i32) ---
	csymm :: proc(layout: Layout, Side: Side, Uplo: UpLo, M, N: i32, alpha: [^]complex64, A: [^]complex64, lda: i32, B: [^]complex64, ldb: i32, beta: [^]complex64, C: [^]complex64, ldc: i32) ---
	csyrk :: proc(layout: Layout, Uplo: UpLo, Trans: Transpose, N, K: i32, alpha: [^]complex64, A: [^]complex64, lda: i32, beta: [^]complex64, C: [^]complex64, ldc: i32) ---
	csyr2k :: proc(layout: Layout, Uplo: UpLo, Trans: Transpose, N, K: i32, alpha: [^]complex64, A: [^]complex64, lda: i32, B: [^]complex64, ldb: i32, beta: [^]complex64, C: [^]complex64, ldc: i32) ---
	ctrmm :: proc(layout: Layout, Side: Side, Uplo: UpLo, TransA: Transpose, Diag: Diag, M, N: i32, alpha: [^]complex64, A: [^]complex64, lda: i32, B: [^]complex64, ldb: i32) ---
	ctrsm :: proc(layout: Layout, Side: Side, Uplo: UpLo, TransA: Transpose, Diag: Diag, M, N: i32, alpha: [^]complex64, A: [^]complex64, lda: i32, B: [^]complex64, ldb: i32) ---

	zgemm :: proc(layout: Layout, TransA: Transpose, TransB: Transpose, M, N, K: i32, alpha: [^]complex128, A: [^]complex128, lda: i32, B: [^]complex128, ldb: i32, beta: [^]complex128, C: [^]complex128, ldc: i32) ---
	zsymm :: proc(layout: Layout, Side: Side, Uplo: UpLo, M, N: i32, alpha: [^]complex128, A: [^]complex128, lda: i32, B: [^]complex128, ldb: i32, beta: [^]complex128, C: [^]complex128, ldc: i32) ---
	zsyrk :: proc(layout: Layout, Uplo: UpLo, Trans: Transpose, N, K: i32, alpha: [^]complex128, A: [^]complex128, lda: i32, beta: [^]complex128, C: [^]complex128, ldc: i32) ---
	zsyr2k :: proc(layout: Layout, Uplo: UpLo, Trans: Transpose, N, K: i32, alpha: [^]complex128, A: [^]complex128, lda: i32, B: [^]complex128, ldb: i32, beta: [^]complex128, C: [^]complex128, ldc: i32) ---
	ztrmm :: proc(layout: Layout, Side: Side, Uplo: UpLo, TransA: Transpose, Diag: Diag, M, N: i32, alpha: [^]complex128, A: [^]complex128, lda: i32, B: [^]complex128, ldb: i32) ---
	ztrsm :: proc(layout: Layout, Side: Side, Uplo: UpLo, TransA: Transpose, Diag: Diag, M, N: i32, alpha: [^]complex128, A: [^]complex128, lda: i32, B: [^]complex128, ldb: i32) ---

	// Routines with prefixes C and Z only
	chemm :: proc(layout: Layout, Side: Side, Uplo: UpLo, M, N: i32, alpha: [^]complex64, A: [^]complex64, lda: i32, B: [^]complex64, ldb: i32, beta: [^]complex64, C: [^]complex64, ldc: i32) ---
	cherk :: proc(layout: Layout, Uplo: UpLo, Trans: Transpose, N, K: i32, alpha: f32, A: [^]complex64, lda: i32, beta: f32, C: [^]complex64, ldc: i32) ---
	cher2k :: proc(layout: Layout, Uplo: UpLo, Trans: Transpose, N, K: i32, alpha: [^]complex64, A: [^]complex64, lda: i32, B: [^]complex64, ldb: i32, beta: f32, C: [^]complex64, ldc: i32) ---

	zhemm :: proc(layout: Layout, Side: Side, Uplo: UpLo, M, N: i32, alpha: [^]complex128, A: [^]complex128, lda: i32, B: [^]complex128, ldb: i32, beta: [^]complex128, C: [^]complex128, ldc: i32) ---
	zherk :: proc(layout: Layout, Uplo: UpLo, Trans: Transpose, N, K: i32, alpha: f64, A: [^]complex128, lda: i32, beta: f64, C: [^]complex128, ldc: i32) ---
	zher2k :: proc(layout: Layout, Uplo: UpLo, Trans: Transpose, N, K: i32, alpha: [^]complex128, A: [^]complex128, lda: i32, B: [^]complex128, ldb: i32, beta: f64, C: [^]complex128, ldc: i32) ---
	// __attribute__((weak))
	xerbla :: proc(p: i32, rout, form: cstring, args: ..any) ---
}

@(default_calling_convention = "c", link_prefix = "cblas_")
foreign blas {
	// ===========================================================================
	// level 1 BLAS functions (complex are recast as routines)
	// ===========================================================================

	// Single and double precision absolute value functions
	dcabs1_64 :: proc(z: [^]complex128) -> f64 ---
	scabs1_64 :: proc(c: [^]complex64) -> f32 ---

	// Dot product and dot-related functions
	sdsdot_64 :: proc(N: i64, alpha: f32, X: [^]f32, incX: i64, Y: [^]f32, incY: i64) -> f32 ---
	dsdot_64 :: proc(N: i64, X: [^]f32, incX: i64, Y: [^]f32, incY: i64) -> f64 ---
	sdot_64 :: proc(N: i64, X: [^]f32, incX: i64, Y: [^]f32, incY: i64) -> f32 ---
	ddot_64 :: proc(N: i64, X: [^]f64, incX: i64, Y: [^]f64, incY: i64) -> f64 ---

	// Complex number dot product functions
	cdotu_sub_64 :: proc(N: i64, X: [^]complex64, incX: i64, Y: [^]complex64, incY: i64, dotu: [^]complex64) ---
	cdotc_sub_64 :: proc(N: i64, X: [^]complex64, incX: i64, Y: [^]complex64, incY: i64, dotc: [^]complex64) ---

	zdotu_sub_64 :: proc(N: i64, X: [^]complex128, incX: i64, Y: [^]complex128, incY: i64, dotu: [^]complex128) ---
	zdotc_sub_64 :: proc(N: i64, X: [^]complex128, incX: i64, Y: [^]complex128, incY: i64, dotc: [^]complex128) ---

	// Norm and sum functions
	snrm2_64 :: proc(N: i64, X: [^]f32, incX: i64) -> f32 ---
	sasum_64 :: proc(N: i64, X: [^]f32, incX: i64) -> f32 ---

	dnrm2_64 :: proc(N: i64, X: [^]f64, incX: i64) -> f64 ---
	dasum_64 :: proc(N: i64, X: [^]f64, incX: i64) -> f64 ---

	scnrm2_64 :: proc(N: i64, X: [^]complex64, incX: i64) -> f32 ---
	scasum_64 :: proc(N: i64, X: [^]complex64, incX: i64) -> f32 ---

	dznrm2_64 :: proc(N: i64, X: [^]complex128, incX: i64) -> f64 ---
	dzasum_64 :: proc(N: i64, X: [^]complex128, incX: i64) -> f64 ---

	// Index functions
	isamax_64 :: proc(N: i64, X: [^]f32, incX: i64) -> Index ---
	idamax_64 :: proc(N: i64, X: [^]f64, incX: i64) -> Index ---
	icamax_64 :: proc(N: i64, X: [^]complex64, incX: i64) -> Index ---
	izamax_64 :: proc(N: i64, X: [^]complex128, incX: i64) -> Index ---

	// ===========================================================================
	// Level 1 BLAS routines
	// ===========================================================================
	// Routines with standard 4 prefixes (s, d, c, z)
	sswap_64 :: proc(N: i64, X, Y: [^]f32, incX, incY: i64) ---
	scopy_64 :: proc(N: i64, X: [^]f32, incX: i64, Y: [^]f32, incY: i64) ---
	saxpy_64 :: proc(N: i64, alpha: f32, X: [^]f32, incX: i64, Y: [^]f32, incY: i64) ---

	dswap_64 :: proc(N: i64, X, Y: [^]f64, incX, incY: i64) ---
	dcopy_64 :: proc(N: i64, X: [^]f64, incX: i64, Y: [^]f64, incY: i64) ---
	daxpy_64 :: proc(N: i64, alpha: f64, X: [^]f64, incX: i64, Y: [^]f64, incY: i64) ---

	cswap_64 :: proc(N: i64, X, Y: [^]complex64, incX, incY: i64) ---
	ccopy_64 :: proc(N: i64, X: [^]complex64, incX: i64, Y: [^]complex64, incY: i64) ---
	caxpy_64 :: proc(N: i64, alpha: complex64, X: [^]complex64, incX: i64, Y: [^]complex64, incY: i64) ---

	zswap_64 :: proc(N: i64, X, Y: [^]complex128, incX, incY: i64) ---
	zcopy_64 :: proc(N: i64, X: [^]complex128, incX: i64, Y: [^]complex128, incY: i64) ---
	zaxpy_64 :: proc(N: i64, alpha: complex128, X: [^]complex128, incX: i64, Y: [^]complex128, incY: i64) ---

	// Routines with S and D prefix only
	srotmg_64 :: proc(d1, d2, b1: [^]f32, b2: f32, P: [^]f32) ---
	srotm_64 :: proc(N: i64, X: [^]f32, incX: i64, Y: [^]f32, incY: i64, P: [^]f32) ---
	drotmg_64 :: proc(d1, d2, b1: [^]f64, b2: f64, P: [^]f64) ---
	drotm_64 :: proc(N: i64, X: [^]f64, incX: i64, Y: [^]f64, incY: i64, P: [^]f64) ---

	// Routines with S D C Z CS and ZD prefixes
	sscal_64 :: proc(N: i64, alpha: f32, X: [^]f32, incX: i64) ---
	dscal_64 :: proc(N: i64, alpha: f64, X: [^]f64, incX: i64) ---
	cscal_64 :: proc(N: i64, alpha: [^]complex64, X: [^]complex64, incX: i64) ---
	zscal_64 :: proc(N: i64, alpha: [^]complex128, X: [^]complex128, incX: i64) ---
	csscal_64 :: proc(N: i64, alpha: f32, X: [^]complex64, incX: i64) ---
	zdscal_64 :: proc(N: i64, alpha: f64, X: [^]complex128, incX: i64) ---

	srotg_64 :: proc(a, b, c, s: [^]f32) ---
	drotg_64 :: proc(a, b, c, s: [^]f64) ---
	crotg_64 :: proc(a, b: [^]complex64, c: [^]f32, s: [^]complex64) ---
	zrotg_64 :: proc(a, b: [^]complex128, c: [^]f64, s: [^]complex128) ---

	srot_64 :: proc(N: i64, X: [^]f32, incX: i64, Y: [^]f32, incY: i64, c, s: f32) ---
	drot_64 :: proc(N: i64, X: [^]f64, incX: i64, Y: [^]f64, incY: i64, c, s: f64) ---
	csrot_64 :: proc(N: i64, X, Y: [^]complex64, incX, incY: i64, c, s: f32) ---
	zdrot_64 :: proc(N: i64, X, Y: [^]complex128, incX, incY: i64, c, s: f64) ---

	// ===========================================================================
	// Prototypes for level 2 BLAS (part 1)
	// ===========================================================================
	// Routines with standard 4 prefixes (S, D, C, Z)
	sgemv_64 :: proc(layout: Layout, TransA: Transpose, M, N: i64, alpha: f32, A: [^]f32, lda: i64, X: [^]f32, incX: i64, beta: f32, Y: [^]f32, incY: i64) ---
	sgbmv_64 :: proc(layout: Layout, TransA: Transpose, M, N: i64, KL, KU: i64, alpha: f32, A: [^]f32, lda: i64, X: [^]f32, incX: i64, beta: f32, Y: [^]f32, incY: i64) ---
	strmv_64 :: proc(layout: Layout, Uplo: UpLo, TransA: Transpose, Diag: i64, N: i64, A: [^]f32, lda: i64, X: [^]f32, incX: i64) ---
	stbmv_64 :: proc(layout: Layout, Uplo: UpLo, TransA: Transpose, Diag: i64, N, K: i64, A: [^]f32, lda: i64, X: [^]f32, incX: i64) ---
	stpmv_64 :: proc(layout: Layout, Uplo: UpLo, TransA: Transpose, Diag: i64, N: i64, Ap: [^]f32, X: [^]f32, incX: i64) ---
	strsv_64 :: proc(layout: Layout, Uplo: UpLo, TransA: Transpose, Diag: i64, N: i64, A: [^]f32, lda: i64, X: [^]f32, incX: i64) ---
	stbsv_64 :: proc(layout: Layout, Uplo: UpLo, TransA: Transpose, Diag: i64, N, K: i64, A: [^]f32, lda: i64, X: [^]f32, incX: i64) ---
	stpsv_64 :: proc(layout: Layout, Uplo: UpLo, TransA: Transpose, Diag: i64, N: i64, Ap: [^]f32, X: [^]f32, incX: i64) ---

	dgemv_64 :: proc(layout: Layout, TransA: Transpose, M, N: i64, alpha: f64, A: [^]f64, lda: i64, X: [^]f64, incX: i64, beta: f64, Y: [^]f64, incY: i64) ---
	dgbmv_64 :: proc(layout: Layout, TransA: Transpose, M, N, KL, KU: i64, alpha: f64, A: [^]f64, lda: i64, X: [^]f64, incX: i64, beta: f64, Y: [^]f64, incY: i64) ---
	dtrmv_64 :: proc(layout: Layout, Uplo: UpLo, TransA: Transpose, Diag: i64, N: i64, A: [^]f64, lda: i64, X: [^]f64, incX: i64) ---
	dtbmv_64 :: proc(layout: Layout, Uplo: UpLo, TransA: Transpose, Diag: i64, N, K: i64, A: [^]f64, lda: i64, X: [^]f64, incX: i64) ---
	dtpmv_64 :: proc(layout: Layout, Uplo: UpLo, TransA: Transpose, Diag: i64, N: i64, Ap: [^]f64, X: [^]f64, incX: i64) ---
	dtrsv_64 :: proc(layout: Layout, Uplo: UpLo, TransA: Transpose, Diag: i64, N: i64, A: [^]f64, lda: i64, X: [^]f64, incX: i64) ---
	dtbsv_64 :: proc(layout: Layout, Uplo: UpLo, TransA: Transpose, Diag: i64, N, K: i64, A: [^]f64, lda: i64, X: [^]f64, incX: i64) ---
	dtpsv_64 :: proc(layout: Layout, Uplo: UpLo, TransA: Transpose, Diag: i64, N: i64, Ap: [^]f64, X: [^]f64, incX: i64) ---

	cgemv_64 :: proc(layout: i64, TransA: i64, M, N: i64, alpha: [^]complex64, A: [^]complex64, lda: i64, X: [^]complex64, incX: i64, beta: [^]complex64, Y: [^]complex64, incY: i64) ---
	cgbmv_64 :: proc(layout: i64, TransA: i64, M, N, KL, KU: i64, alpha: [^]complex64, A: [^]complex64, lda: i64, X: [^]complex64, incX: i64, beta: [^]complex64, Y: [^]complex64, incY: i64) ---
	ctrmv_64 :: proc(layout: Layout, Uplo: UpLo, TransA: Transpose, Diag: i64, N: i64, A: [^]complex64, lda: i64, X: [^]complex64, incX: i64) ---
	ctbmv_64 :: proc(layout: Layout, Uplo: UpLo, TransA: Transpose, Diag: i64, N, K: i64, A: [^]complex64, lda: i64, X: [^]complex64, incX: i64) ---
	ctpmv_64 :: proc(layout: Layout, Uplo: UpLo, TransA: Transpose, Diag: i64, N: i64, Ap: [^]complex64, X: [^]complex64, incX: i64) ---
	ctrsv_64 :: proc(layout: Layout, Uplo: UpLo, TransA: Transpose, Diag: i64, N: i64, A: [^]complex64, lda: i64, X: [^]complex64, incX: i64) ---
	ctbsv_64 :: proc(layout: Layout, Uplo: UpLo, TransA: Transpose, Diag: i64, N, K: i64, A: [^]complex64, lda: i64, X: [^]complex64, incX: i64) ---
	ctpsv_64 :: proc(layout: Layout, Uplo: UpLo, TransA: Transpose, Diag: i64, N: i64, Ap: [^]complex64, X: [^]complex64, incX: i64) ---

	zgemv_64 :: proc(layout: Layout, TransA: Transpose, M, N: i64, alpha: [^]complex128, A: [^]complex128, lda: i64, X: [^]complex128, incX: i64, beta: [^]complex128, Y: [^]complex128, incY: i64) ---
	zgbmv_64 :: proc(layout: Layout, TransA: Transpose, M, N, KL, KU: i64, alpha: [^]complex128, A: [^]complex128, lda: i64, X: [^]complex128, incX: i64, beta: [^]complex128, Y: [^]complex128, incY: i64) ---
	ztrmv_64 :: proc(layout: Layout, Uplo: UpLo, TransA: Transpose, Diag: i64, N: i64, A: [^]complex128, lda: i64, X: [^]complex128, incX: i64) ---
	ztbmv_64 :: proc(layout: Layout, Uplo: UpLo, TransA: Transpose, Diag: Diag, N, K: i64, A: [^]complex128, lda: i64, X: [^]complex128, incX: i64) ---
	ztpmv_64 :: proc(layout: Layout, Uplo: UpLo, TransA: Transpose, Diag: Diag, N: i64, Ap: [^]complex128, X: [^]complex128, incX: i64) ---
	ztrsv_64 :: proc(layout: Layout, Uplo: UpLo, TransA: Transpose, Diag: Diag, N: i64, A: [^]complex128, lda: i64, X: [^]complex128, incX: i64) ---
	ztbsv_64 :: proc(layout: Layout, Uplo: UpLo, TransA: Transpose, Diag: Diag, N, K: i64, A: [^]complex128, lda: i64, X: [^]complex128, incX: i64) ---
	ztpsv_64 :: proc(layout: Layout, Uplo: UpLo, TransA: Transpose, Diag: Diag, N: i64, Ap: [^]complex128, X: [^]complex128, incX: i64) ---

	// Routines with S and D prefixes only
	ssymv_64 :: proc(layout: Layout, Uplo: UpLo, N: i64, alpha: f32, A: [^]f32, lda: i64, X: [^]f32, incX: i64, beta: f32, Y: [^]f32, incY: i64) ---
	ssbmv_64 :: proc(layout: Layout, Uplo: UpLo, N, K: i64, alpha: f32, A: [^]f32, lda: i64, X: [^]f32, incX: i64, beta: f32, Y: [^]f32, incY: i64) ---
	sspmv_64 :: proc(layout: Layout, Uplo: UpLo, N: i64, alpha: f32, Ap: [^]f32, X: [^]f32, incX: i64, beta: f32, Y: [^]f32, incY: i64) ---
	sger_64 :: proc(layout: Layout, M, N: i64, alpha: f32, X: [^]f32, incX: i64, Y: [^]f32, incY: i64, A: [^]f32, lda: i64) ---
	ssyr_64 :: proc(layout: Layout, Uplo: UpLo, N: i64, alpha: f32, X: [^]f32, incX: i64, A: [^]f32, lda: i64) ---
	sspr_64 :: proc(layout: Layout, Uplo: UpLo, N: i64, alpha: f32, X: [^]f32, incX: i64, Ap: [^]f32) ---
	ssyr2_64 :: proc(layout: Layout, Uplo: UpLo, N: i64, alpha: f32, X: [^]f32, incX: i64, Y: [^]f32, incY: i64, A: [^]f32, lda: i64) ---
	sspr2_64 :: proc(layout: Layout, Uplo: UpLo, N: i64, alpha: f32, X: [^]f32, incX: i64, Y: [^]f32, incY: i64, A: [^]f32) ---
	dsymv_64 :: proc(layout: Layout, Uplo: UpLo, N: i64, alpha: f64, A: [^]f64, lda: i64, X: [^]f64, incX: i64, beta: f64, Y: [^]f64, incY: i64) ---
	dsbmv_64 :: proc(layout: Layout, Uplo: UpLo, N, K: i64, alpha: f64, A: [^]f64, lda: i64, X: [^]f64, incX: i64, beta: f64, Y: [^]f64, incY: i64) ---
	dspmv_64 :: proc(layout: Layout, Uplo: UpLo, N: i64, alpha: f64, Ap: [^]f64, X: [^]f64, incX: i64, beta: f64, Y: [^]f64, incY: i64) ---
	dger_64 :: proc(layout: Layout, M, N: i64, alpha: f64, X: [^]f64, incX: i64, Y: [^]f64, incY: i64, A: [^]f64, lda: i64) ---
	dsyr_64 :: proc(layout: Layout, Uplo: UpLo, N: i64, alpha: f64, X: [^]f64, incX: i64, A: [^]f64, lda: i64) ---
	dspr_64 :: proc(layout: Layout, Uplo: UpLo, N: i64, alpha: f64, X: [^]f64, incX: i64, Ap: [^]f64) ---
	dsyr2_64 :: proc(layout: Layout, Uplo: UpLo, N: i64, alpha: f64, X: [^]f64, incX: i64, Y: [^]f64, incY: i64, A: [^]f64, lda: i64) ---
	dspr2_64 :: proc(layout: Layout, Uplo: UpLo, N: i64, alpha: f64, X: [^]f64, incX: i64, Y: [^]f64, incY: i64, A: [^]f64) ---

	chemv_64 :: proc(layout: Layout, Uplo: UpLo, N: i64, alpha: [^]complex64, A: [^]complex64, lda: i64, X: [^]complex64, incX: i64, beta: [^]complex64, Y: [^]complex64, incY: i64) ---
	chbmv_64 :: proc(layout: Layout, Uplo: UpLo, N, K: i64, alpha: [^]complex64, A: [^]complex64, lda: i64, X: [^]complex64, incX: i64, beta: [^]complex64, Y: [^]complex64, incY: i64) ---
	chpmv_64 :: proc(layout: Layout, Uplo: UpLo, N: i64, alpha: [^]complex64, Ap: [^]complex64, X: [^]complex64, incX: i64, beta: [^]complex64, Y: [^]complex64, incY: i64) ---
	cgeru_64 :: proc(layout: Layout, M, N: i64, alpha: [^]complex64, X: [^]complex64, incX: i64, Y: [^]complex64, incY: i64, A: [^]complex64, lda: i64) ---
	cgerc_64 :: proc(layout: Layout, M, N: i64, alpha: [^]complex64, X: [^]complex64, incX: i64, Y: [^]complex64, incY: i64, A: [^]complex64, lda: i64) ---
	ssymm_64 :: proc(layout: Layout, Side: Side, Uplo: UpLo, M, N: i64, alpha: f32, A: [^]f32, lda: i64, B: [^]f32, ldb: i64, beta: f32, C: [^]f32, ldc: i64) ---
	ssyrk_64 :: proc(layout: Layout, Uplo: UpLo, Trans: Transpose, N, K: i64, alpha: f32, A: [^]f32, lda: i64, beta: f32, C: [^]f32, ldc: i64) ---
	ssyr2k_64 :: proc(layout: Layout, Uplo: UpLo, Trans: Transpose, N, K: i64, alpha: f32, A: [^]f32, lda: i64, B: [^]f32, ldb: i64, beta: f32, C: [^]f32, ldc: i64) ---
	strmm_64 :: proc(layout: Layout, Side: Side, Uplo: UpLo, TransA: Transpose, Diag: Diag, M, N: i64, alpha: f32, A: [^]f32, lda: i64, B: [^]f32, ldb: i64) ---
	strsm_64 :: proc(layout: Layout, Side: Side, Uplo: UpLo, TransA: Transpose, Diag: Diag, M, N: i64, alpha: f32, A: [^]f32, lda: i64, B: [^]f32, ldb: i64) ---

	dgemm_64 :: proc(layout: Layout, TransA: Transpose, TransB: Transpose, M, N, K: i64, alpha: f64, A: [^]f64, lda: i64, B: [^]f64, ldb: i64, beta: f64, C: [^]f64, ldc: i64) ---
	dsymm_64 :: proc(layout: Layout, Side: Side, Uplo: UpLo, M, N: i64, alpha: f64, A: [^]f64, lda: i64, B: [^]f64, ldb: i64, beta: f64, C: [^]f64, ldc: i64) ---
	dsyrk_64 :: proc(layout: Layout, Uplo: UpLo, Trans: Transpose, N, K: i64, alpha: f64, A: [^]f64, lda: i64, beta: f64, C: [^]f64, ldc: i64) ---
	dsyr2k_64 :: proc(layout: Layout, Uplo: UpLo, Trans: Transpose, N, K: i64, alpha: f64, A: [^]f64, lda: i64, B: [^]f64, ldb: i64, beta: f64, C: [^]f64, ldc: i64) ---
	dtrmm_64 :: proc(layout: Layout, Side: Side, Uplo: UpLo, TransA: Transpose, Diag: Diag, M, N: i64, alpha: f64, A: [^]f64, lda: i64, B: [^]f64, ldb: i64) ---
	dtrsm_64 :: proc(layout: Layout, Side: Side, Uplo: UpLo, TransA: Transpose, Diag: Diag, M, N: i64, alpha: f64, A: [^]f64, lda: i64, B: [^]f64, ldb: i64) ---
	cgemm_64 :: proc(layout: Layout, TransA: Transpose, TransB: Transpose, M, N, K: i64, alpha: [^]complex64, A: [^]complex64, lda: i64, B: [^]complex64, ldb: i64, beta: [^]complex64, C: [^]complex64, ldc: i64) ---
	csymm_64 :: proc(layout: Layout, Side: Side, Uplo: UpLo, M, N: i64, alpha: [^]complex64, A: [^]complex64, lda: i64, B: [^]complex64, ldb: i64, beta: [^]complex64, C: [^]complex64, ldc: i64) ---
	csyrk_64 :: proc(layout: Layout, Uplo: UpLo, Trans: Transpose, N, K: i64, alpha: [^]complex64, A: [^]complex64, lda: i64, beta: [^]complex64, C: [^]complex64, ldc: i64) ---
	csyr2k_64 :: proc(layout: Layout, Uplo: UpLo, Trans: Transpose, N, K: i64, alpha: [^]complex64, A: [^]complex64, lda: i64, B: [^]complex64, ldb: i64, beta: [^]complex64, C: [^]complex64, ldc: i64) ---
	ctrmm_64 :: proc(layout: Layout, Side: Side, Uplo: UpLo, TransA: Transpose, Diag: Diag, M, N: i64, alpha: [^]complex64, A: [^]complex64, lda: i64, B: [^]complex64, ldb: i64) ---
	ctrsm_64 :: proc(layout: Layout, Side: Side, Uplo: UpLo, TransA: Transpose, Diag: Diag, M, N: i64, alpha: [^]complex64, A: [^]complex64, lda: i64, B: [^]complex64, ldb: i64) ---

	zgemm_64 :: proc(layout: Layout, TransA: Transpose, TransB: Transpose, M, N, K: i64, alpha: [^]complex128, A: [^]complex128, lda: i64, B: [^]complex128, ldb: i64, beta: [^]complex128, C: [^]complex128, ldc: i64) ---
	zsymm_64 :: proc(layout: Layout, Side: Side, Uplo: UpLo, M, N: i64, alpha: [^]complex128, A: [^]complex128, lda: i64, B: [^]complex128, ldb: i64, beta: [^]complex128, C: [^]complex128, ldc: i64) ---
	zsyrk_64 :: proc(layout: Layout, Uplo: UpLo, Trans: Transpose, N, K: i64, alpha: [^]complex128, A: [^]complex128, lda: i64, beta: [^]complex128, C: [^]complex128, ldc: i64) ---
	zsyr2k_64 :: proc(layout: Layout, Uplo: UpLo, Trans: Transpose, N, K: i64, alpha: [^]complex128, A: [^]complex128, lda: i64, B: [^]complex128, ldb: i64, beta: [^]complex128, C: [^]complex128, ldc: i64) ---
	ztrmm_64 :: proc(layout: Layout, Side: Side, Uplo: UpLo, TransA: Transpose, Diag: Diag, M, N: i64, alpha: [^]complex128, A: [^]complex128, lda: i64, B: [^]complex128, ldb: i64) ---
	ztrsm_64 :: proc(layout: Layout, Side: Side, Uplo: UpLo, TransA: Transpose, Diag: Diag, M, N: i64, alpha: [^]complex128, A: [^]complex128, lda: i64, B: [^]complex128, ldb: i64) ---

	// Routines with prefixes C and Z only
	chemm_64 :: proc(layout: Layout, Side: Side, Uplo: UpLo, M, N: i64, alpha: [^]complex64, A: [^]complex64, lda: i64, B: [^]complex64, ldb: i64, beta: [^]complex64, C: [^]complex64, ldc: i64) ---
	cherk_64 :: proc(layout: Layout, Uplo: UpLo, Trans: Transpose, N, K: i64, alpha: f32, A: [^]complex64, lda: i64, beta: f32, C: [^]complex64, ldc: i64) ---
	cher2k_64 :: proc(layout: Layout, Uplo: UpLo, Trans: Transpose, N, K: i64, alpha: [^]complex64, A: [^]complex64, lda: i64, B: [^]complex64, ldb: i64, beta: f32, C: [^]complex64, ldc: i64) ---

	zhemm_64 :: proc(layout: Layout, Side: Side, Uplo: UpLo, M, N: i64, alpha: [^]complex128, A: [^]complex128, lda: i64, B: [^]complex128, ldb: i64, beta: [^]complex128, C: [^]complex128, ldc: i64) ---
	zherk_64 :: proc(layout: Layout, Uplo: UpLo, Trans: Transpose, N, K: i64, alpha: f64, A: [^]complex128, lda: i64, beta: f64, C: [^]complex128, ldc: i64) ---
	zher2k_64 :: proc(layout: Layout, Uplo: UpLo, Trans: Transpose, N, K: i64, alpha: [^]complex128, A: [^]complex128, lda: i64, B: [^]complex128, ldb: i64, beta: f64, C: [^]complex128, ldc: i64) ---
	// __attribute__((weak))
	xerbla_64 :: proc(p: i64, rout, form: cstring, args: ..any) ---
}
