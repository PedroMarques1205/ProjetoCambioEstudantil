abstract class NovaVantagemState {}

class NovaVantagemInitial extends NovaVantagemState {}

class NovaVantagemLoading extends NovaVantagemState {}

class NovaVantagemSuccess extends NovaVantagemState {}

class NovaVantagemFailure extends NovaVantagemState {
  final String message;

  NovaVantagemFailure(this.message);
}
