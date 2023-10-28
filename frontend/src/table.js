import React, { Component } from "react";
import axios from 'axios'; // npm instal axios
import { DataGrid } from '@mui/x-data-grid';

const columns = [
  { field: 'attrition', headerName: 'attrition', width: 70 },
  { field: 'attrition_reason', headerName: 'Attrition reason', width: 230 },
  { field: 'deptid', headerName: 'Department id', width: 130 },
  {
    field: 'empid',
    headerName: 'Employee id',
    type: 'number',
    width: 190,
  },
  {
    field: 'yearssincelastpromotion',
    headerName: 'Yrs since last promotion',
    // description: 'This column has a value getter and is not sortable.',
    type: 'number',
    sortable: false,
    width: 260,
//     valueGetter: (params) =>
//       `${params.row.firstName || ''} ${params.row.lastName || ''}`,
  },
  {
    field: 'yearswithcurrentmanager',
    headerName: 'Years with current manager',
    type: 'number',
    width: 260
  }
];

export default class Table extends Component {
    constructor(props) {
      super(props);
      this.state = {attrition: []};   
    }

    componentDidMount(prevProps){
        const url = 'http://127.0.0.1:5000/';
        axios.get(url)
        .then(results=> {
            console.log(results);
            // this.setState({attrition: results.data})
            var newArr = results.data.map(function(val) {          
                return {
                  id: val.empid,
                  empid: val.empid,
                  deptid: val.deptid,
                  attrition: val.attrition,          
                  attrition_reason: val.attrition_reason,          
                  yearssincelastpromotion: val.yearssincelastpromotion,          
                  yearswithcurrentmanager: val.yearswithcurrentmanager,
                };
              });
              console.log(results.data); 
              this.setState({
                attrition: newArr  //set state of the weather5days
              },()=> {
                 console.log(this.state.attrition); 
                 console.log('this.tableArray ',this.state.attrition);
              });      
        })

        
    }
    render() {
        return (
            <div style={{ height: 400, width: '100%' }}>
              <DataGrid
                rows={this.state.attrition}
                columns={columns}
                pageSize={5}
                rowsPerPageOptions={[5]}
                checkboxSelection
              />
            </div>
          );
      }
    }
      