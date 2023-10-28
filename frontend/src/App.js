import React, { Component } from 'react';
import Form from './form';
import Table from './table';
import Button from '@mui/material/Button';

class App extends Component {
  render() {
    return (
      <div >
        
        <Table></Table>
        {/* <Button primary>Add a row</Button> */}
        <Form></Form>
        
      </div>
    );
  }
       
}

export default App;
