package lapack
import "core:fmt"

main :: proc() {
	x := [?]f64{1, 2, 3, 4, 5}
	dscal(len(x), 2.0, &x[0], 1)
	fmt.println("After Scaling:", x) // [2, 4, 6, 8, 10]
}
