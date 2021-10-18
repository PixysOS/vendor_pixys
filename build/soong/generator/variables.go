package generator

import (
	"fmt"

	"android/soong/android"
)

func pixysExpandVariables(ctx android.ModuleContext, in string) string {
	pixysVars := ctx.Config().VendorConfig("pixysVarsPlugin")

	out, err := android.Expand(in, func(name string) (string, error) {
		if pixysVars.IsSet(name) {
			return pixysVars.String(name), nil
		}
		// This variable is not for us, restore what the original
		// variable string will have looked like for an Expand
		// that comes later.
		return fmt.Sprintf("$(%s)", name), nil
	})

	if err != nil {
		ctx.PropertyErrorf("%s: %s", in, err.Error())
		return ""
	}

	return out
}
