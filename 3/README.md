# prove demo

can_fail.t either passes or fails, depending on the FORCE_FAILURE environment variable.

To demo prove with all tests passing:

  prove

To demo with failing tests:

  FORCE_FAILURE=1 prove

To demo saved state:

  FORCE_FAILURE=1 prove --state=save # demo saving of state
	FORCE_FAILURE=1 prove --state=failed,save --verbose # demo that only the failed test runs
	prove --state=failed,save # make the failed test pass
	prove --state=failed,save # note that no tests run because nothing has failed

	FORCE_FAILURE=1 prove -r --state=hot,new,save # saves status of all tests
	prove -r --state=hot,new,save # runs all tests, most-recently-failed first


