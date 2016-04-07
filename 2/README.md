# Test::More examples

1. test-more-demo.pl - shows off most of Test::More's features.

 * line 12: ok()
 * line 14: BAIL_OUT()
 * lines 17-19: is() and isnt()
 * lines 21-22: like() and unlike()
 * line 33: is_deeply()
 * lines 36-38: can_ok() and isa_ok()
 * lines 40-41: fail() and pass()
 * lines 43-47: SKIP
 * lines 49-52: TODO
 * lines 54-55: note() and diag()
 * line 56: done_testing()

Run it like this:

    FAIL_HORRIBLY=1 prove test-more-demo.pl # demos BAIL_OUT
		prove test-more-demo.pl  # demos all but note()
		prove --verbose test-more-demo.pl  # includes note()


