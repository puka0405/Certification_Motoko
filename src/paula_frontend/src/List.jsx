import React from `react`
import {container, Row, Card} from `react-bootstrap` 
import Table from 'react-bootstrap/Table';
import { useEffect, useState } from 'react';
import { registro_Alumnos_backend } from 'declarations/registro_Alumnos_backend';

function List() {
      const [alumnos, setalumnos] = useState([]);

  useEffect(() => {
    getAlumnos();
    
  }, []); 

  function getAlumnos() {
    try {
    registro_Alumnos_backend.getAllAlumnos().then(Alumnos=>{
        setalumnos(Alumnos);
      });
      console.log("alumno_motoko", alumno_motoko)
      
    } catch (error) {
      console.log("Hubo un error")
    };

    return false;
  
    
  };
  return(
  <container>
  <Row>
  <Card>
  <Card.Body>
  <Card.Title>Listado de aa</Card.Title>
    <Table>
      <thead>
        <tr>
          <th>id</th>
          <th>name</th>
          <th>age</th>
          <th>cuater</th>
          <th>major</th>
          <th>grade</th>
        </tr>
      </thead>
      <tbody>
        {
          alumnos.length > 0 ?
          alumnos.map((Alumno) => (

        <tr>
          <td>{Number(Alumno.id)}</td>
          <td>{Alumno.name}</td>
          <td>{Number(Alumno.age)}</td>
          <td>{Number(Alumno.cuarter)}</td>
          <td>{Alumno.major}</td>
          <td>{Number(Alumno.grade)}</td>
        </tr>
      )
    )
    :<tr></tr>
  }

      </tbody>
    </Table>
  </Card.Body>
  </Card>
  </Row>
  </container>
  );    
}



export default List;
