import List "mo:base/List";
import Debug "mo:base/Debug";


actor DKeeper {
  // declaring new data type store in each title & content
  public type Note = {
    title : Text;
    content : Text;
  };

  // store list arrays with empty list
  // use stable to prevent dfx deploy,data still exist
  stable var notes : List.List<Note> = List.nil<Note>();

  // create newnotes
  public func createNote(titleText : Text, contentText : Text) {

    let newNote : Note = {
      title = titleText;
      content = contentText;
    };

// to push list into new list newNote for the note, notes where the note appear
   notes:= List.push(newNote, notes);
   Debug.print(debug_show (notes));
  };

public query func readNotes():async[Note]{
  return List.toArray(notes);
};

// remove list for backend take, drop, append
public func removeNote(id: Nat){
let listFront = List.take(notes, id);
let listBack = List.drop(notes,id + 1);
notes := List.append(listFront,listBack);
}

};
