import Array "mo:base/Array";
import Text "mo:base/Text";
import Nat "mo:base/Nat";

actor registroAlumnos {

  type MyTuple = (Nat, Text);

  type Alumno = {
    id : Nat;
    name : Text;
    age : Nat;
    cuarter : Nat;
    major : Text;
    grade : Nat;
  };

  var alumnos : [Alumno] = [
    {
      id = 23090794;
      name = "Luis Gerardo Padrón Soria";
      age = 18;
      cuarter = 3;
      major = "TIDSM";
      grade = 9;
    }
  ];

  public func addAlumno(id : Nat, name : Text, age : Nat, cuarter : Nat, major : Text, grade : Nat) : async Bool {
    let newid = Array.size(alumnos) + 1;
    let newAlumno = {
      id = id;
      name = name;
      age = age;
      cuarter = cuarter;
      major = major;
      grade = grade;
    };
    alumnos := Array.append<Alumno>(alumnos, [newAlumno]);
    return true;
  };

  public func getAllAlumnos() : async [Alumno] {

    return alumnos;

  };
//Salta un error
  public func getAlumnoById(id : Nat) : async ?Alumno {
    return Array.find<Alumno>(alumnos, func(m) { m.id == id });
  };

  public func updateAlumno(id : Nat, name : Text, age : Nat, cuarter : Nat, major : Text, grade : Nat) : async Bool {
    let alumnoToUpdate = Array.find<Alumno>(alumnos, func(alumno) { alumno.id == id });

    switch (alumnoToUpdate) {
      case (null) { return false };
      case (?alumnoToUpdate) {
        let updatedAlumno = {
          id = id;
          name = name;
          age = age;
          cuarter = cuarter;
          major = major;
          grade = grade;
        };
        alumnos := Array.map<Alumno, Alumno>(alumnos, func(m) { if (m.id == id) { updatedAlumno } else { m } });
        return true;
      };
    };
  };

  public func deleteAlumno(id : Nat) : async Bool {
    let alumno = Array.find<Alumno>(alumnos, func(alumno) { alumno.id == id });
    if (alumno != null) {
      alumnos := Array.filter<Alumno>(alumnos, func(alumno) { alumno.id != id });
      return true;
    } else {
      return false;
    };
  };
};