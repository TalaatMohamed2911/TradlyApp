abstract class BaseViewModel with BaseViewModelInputs, BaseViewModelOutputs {
  // shared variables and functions that will be used across all view models

  // final _inputStateStreamController = StreamController<FlowState>.broadcast();

  // @override
  // Sink get inputState => _inputStateStreamController.sink;

  // @override
  // Stream<FlowState> get outputState =>
  //     _inputStateStreamController.stream.map((flowState) => flowState);

  // @override
  // void dispose() {
  //   _inputStateStreamController.close();
  // }
}

abstract mixin class BaseViewModelInputs {
  void start();

  void dispose();

  // Sink get inputState;
}

abstract mixin class BaseViewModelOutputs {
  // Stream<FlowState> get outputState;
}
