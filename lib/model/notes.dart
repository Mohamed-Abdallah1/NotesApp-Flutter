

class Notes{
  String? notes_content;
  String? notes_name;
  int? note_id;

  Notes({required this.notes_content,required this.notes_name});

  Notes.fromJson(Map<String,dynamic> json){
    notes_content = json["notes_content"] ?? "";
    notes_name = json["notes_name"]??"";
    note_id=json["id"]??"";

  }

  Map<String,dynamic> toJson(){
    return {
      "notes_content":notes_content,
      "notes_name":notes_name,
      "id":note_id,
    };
  }
  


}