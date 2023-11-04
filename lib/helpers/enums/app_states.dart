// unauthenticated ===> user has been registered on the device but not signed in
// authenticated  =====> user has registered and signed up
//  noState ====> user has not registered on the device at all
//  suspended  ====> for a letter use

enum AppStates { authenticated, unAuthenticated, noState, suspended }
