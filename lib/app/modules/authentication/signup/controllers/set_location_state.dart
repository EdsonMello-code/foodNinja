sealed class SetLocationState {}

class SetLocationStateIdle implements SetLocationState {}

class SetLocationStateLoading implements SetLocationState {}

class SetLocationStateAdded implements SetLocationState {}

class SetLocationStateFailure implements SetLocationState {}
