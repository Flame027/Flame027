
# Package dependencies.
# Automatically generated by project defintion.

task "stx:libwidg3" => "stx:libview"
task "stx:libwidg3" => "stx:libui"
task "stx:libwidg3" => "stx:libview2"
task "stx:libwidg3" => "stx:libwidg"
task "stx:libwidg3" => "stx:libbasic2"
task "stx:libwidg3" => "stx:libwidg2"
task "stx:libwidg3" => "stx:libbasic"


task "stx:goodies/refactoryBrowser/parser" => "stx:libbasic"

task "stx:libwidg" => "stx:libview2"
task "stx:libwidg" => "stx:libview"
task "stx:libwidg" => "stx:libbasic2"
task "stx:libwidg" => "stx:libui"
task "stx:libwidg" => "stx:libbasic"

task "stx:goodies/sunit" => "stx:libview2"
task "stx:goodies/sunit" => "stx:libview"
task "stx:goodies/sunit" => "stx:libbasic"

task "squeak:petitparser" => "stx:goodies/sunit"
task "squeak:petitparser" => "stx:libbasic2"
task "squeak:petitparser" => "stx:libbasic"

task "stx:libview2" => "stx:libview"
task "stx:libview2" => "stx:libbasic2"
task "stx:libview2" => "stx:libbasic"

task "stx:libbasic2" => "stx:libbasic"

task "stx:libview" => "stx:libbasic2"
task "stx:libview" => "stx:libbasic"

task "stx:libhtml" => "stx:libwidg"
task "stx:libhtml" => "stx:libview"
task "stx:libhtml" => "stx:libbasic"

task "stx:libtool" => "stx:libwidg2"
task "stx:libtool" => "stx:libbasic3"
task "stx:libtool" => "stx:goodies/refactoryBrowser/parser"
task "stx:libtool" => "stx:libcomp"
task "stx:libtool" => "stx:libbasic2"
task "stx:libtool" => "stx:libui"
task "stx:libtool" => "stx:libview2"
task "stx:libtool" => "stx:libboss"
task "stx:libtool" => "stx:libwidg"
task "stx:libtool" => "stx:libbasic"
task "stx:libtool" => "stx:libview"
task "stx:libtool" => "stx:libwidg3"

task "stx:libcomp" => "stx:libbasic"

task "stx:libboss" => "stx:libbasic"

task "stx:libwidg2" => "stx:libview"
task "stx:libwidg2" => "stx:libui"
task "stx:libwidg2" => "stx:libview2"
task "stx:libwidg2" => "stx:libwidg"
task "stx:libwidg2" => "stx:libbasic2"
task "stx:libwidg2" => "stx:libbasic"

task "stx:libbasic3" => "stx:libbasic2"
task "stx:libbasic3" => "stx:libbasic"

task "stx:libui" => "stx:libview2"
task "stx:libui" => "stx:libview"
task "stx:libui" => "stx:libbasic"

task "stx:libjava" => "stx:libwidg2"
task "stx:libjava" => "squeak:petitparser"
task "stx:libjava" => "stx:libbasic3"
task "stx:libjava" => "stx:libcomp"
task "stx:libjava" => "stx:libbasic2"
task "stx:libjava" => "stx:libview2"
task "stx:libjava" => "stx:goodies/sunit"
task "stx:libjava" => "stx:libhtml"
task "stx:libjava" => "stx:libwidg"
task "stx:libjava" => "stx:libbasic"
task "stx:libjava" => "stx:libview"
task "stx:libjava" => "stx:libtool"


