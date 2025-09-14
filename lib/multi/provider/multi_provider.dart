import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:file_picker/file_picker.dart';
import 'package:authority/authority.dart'
    as authority
    show Document, View, NodeType, CurrentNode, Ref;

part 'multi_provider.g.dart';

class DocState {
  int current;
  List<authority.Document> documents;

  DocState({required this.current, required this.documents});
}

@Riverpod(keepAlive: true)
class Documents extends _$Documents {
  @override
  DocState build() {
    final em = authority.Document.empty();
    em.addChild((
      authority.NodeType.rootType,
      0,
    ), authority.NodeType.contextType);
    em.setCurrent((authority.NodeType.contextType, 0));
    return DocState(current: 0, documents: [em]);
  }

  void load(PlatformFile f) {
    state.documents.add(authority.Document.load(f));
    state.current = state.documents.length - 1;
    ref.notifyListeners();
  }

  void newDocument() {
    state.documents.add(authority.Document.empty());
    state.current = state.documents.length - 1;
    ref.notifyListeners();
  }

  void drop(int index) {
    if (state.documents.length > 1) {
      if (state.current == state.documents.length - 1) {
        state.current -= 1;
      }
      state.documents.removeAt(index);
      ref.notifyListeners();
    }
  }

  void paneChanged(int pane) {
    state.current = pane;
    ref.notifyListeners();
  }

  void selectionChanged(authority.Ref aref) {
    if (aref.$1 == authority.NodeType.none) return;
    state.documents[state.current].setCurrent(aref);
    ref.notifyListeners();
  }

  void viewChanged(String view) {
    switch (view) {
      case "source":
        state.documents[state.current].view = authority.View.source;
      default:
        state.documents[state.current].view = authority.View.edit;
    }
    ref.notifyListeners();
  }

  void addChild(authority.Ref aref, authority.NodeType nt) {
    state.documents[state.current].addChild(aref, nt);
    ref.notifyListeners();
  }

  void addSibling(authority.Ref aref, authority.NodeType nt) {
    state.documents[state.current].addSibling(aref, nt);
    ref.notifyListeners();
  }

  void dropNode(authority.Ref aref) {
    state.documents[state.current].dropNode(aref);
    ref.notifyListeners();
  }

  void refresh() {
    state.documents[state.current].refreshTree();
    ref.notifyListeners();
  }
}

@riverpod
class Node extends _$Node {
  @override
  authority.CurrentNode build() {
    final documents = ref.watch(documentsProvider);
    return documents.documents[documents.current].current();
  }

  void multiAdd(String element, String? sub) {
    state.multiAdd(element, sub);
    ref.notifyListeners();
  }

  void multiDrop(String element, int index) {
    state.multiDrop(element, index);
    ref.notifyListeners();
  }

  void multiUp(String element, int index) {
    state.multiUp(element, index);
    ref.notifyListeners();
  }

  void multiDown(String element, int index) {
    state.multiDown(element, index);
    ref.notifyListeners();
  }
}
