part of 'cat_page_bloc.dart';

@immutable
abstract class CatsEvent extends Equatable {
  const CatsEvent();
}

class CatsLoadedEvent extends CatsEvent {
  final List<Cat> list;
  const CatsLoadedEvent(this.list);
  @override
  List<Object?> get props => [list];
}

class LoadCatIdEvent extends CatsEvent {
  final String? catID;
  const LoadCatIdEvent(this.catID);
  @override
  List<Object?> get props => [catID];
}

class LanguageChangeEvent extends CatsEvent {
  final String langCode;
  const LanguageChangeEvent(this.langCode);

  @override
  List<Object?> get props => [langCode];
}

class SearchEvent extends CatsEvent {
  final String query;
  const SearchEvent(this.query);

  @override
  List<Object?> get props => [query];
}

class FilterEvent extends CatsEvent {
  final Set<int> filtersID;
  const FilterEvent(this.filtersID);

  @override
  List<Object?> get props => [filtersID];
}

class AdoptedEvent extends CatsEvent {
  final Set<int> filtersID;
  const AdoptedEvent(this.filtersID);
  @override
  List<Object?> get props => [filtersID];
}

class LoadCatsEvent extends CatsEvent {
  const LoadCatsEvent();
  @override
  List<Object?> get props => [];
}

class LoadMoreEvent extends CatsEvent {
  const LoadMoreEvent();
  @override
  List<Object?> get props => [];
}
