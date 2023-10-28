// import React, { Component } from 'react';
// import axios from 'axios';
// import {FormControl} from '@mui/material';

// const attrition = [
//     {
//       value: 'YES',
//       label: 'YES',
//     },
//     {
//       value: 'NO',
//       label: 'NO',
//     }
//   ];
// const attrition_reason = [
//     {
//       value: null,
//       label: '_',
//     },
//     {
//       value: 'LONG WORKING HOURS',
//       label: 'Long Working hours',
//     },
//     {
//       value: 'ENVIRONMENT SATISFACTION',
//       label: 'Environment dissastisfaction',
//     },
//     {
//       value: 'PERSONAL ISSUES',
//       label: 'Personal issues',
//     },
//     {
//       value: 'LOW PAY',
//       label: 'Low pay',
//     }
//   ];
// // class Form extends Component {
// //   constructor(props) {
// //     super(props);
// //     const { steps } = this.props;
// //     const { submit, firstname, lastname, email } = steps;

// //     this.state =  { submit, firstname, lastname, email }; 
// //   }


// // //   componentDidMount() {
// // //     const userObject = {
// // //       submit:this.state.submit.value,
// // //       first_name:this.state.firstname.value,
// // //       last_name:this.state.lastname.value,
// // //       email:this.state.email.value,
// // //     };
// // //     axios.post(`/api`, userObject)
// // //     .then(res => {
// // //       console.log(res.status)
// // //     }).catch(function(error) {
// // //       console.log(error);
// // //     });
// // //   }

// //   render() {
// //     return (
// //         <FormControl>
// //   <InputLabel htmlFor="my-input">Email address</InputLabel>
// //   <Input id="my-input" aria-describedby="my-helper-text" />
// //   <FormHelperText id="my-helper-text">We'll never share your email.</FormHelperText>
// // </FormControl>
// //       <div>Thank you! Your data was submitted successfully!</div>
// //       );
// //     }
// //   };

// //   export default Form;

// export default function SelectTextFields() {
//     const [currency, setCurrency] = React.useState('EUR');
  
//     const handleChange = (event) => {
//       setCurrency(event.target.value);
//     };
  
//     return (
//       <Box
//         component="form"
//         sx={{
//           '& .MuiTextField-root': { m: 1, width: '25ch' },
//         }}
//         noValidate
//         autoComplete="off"
//       >
//         <div>
//           <TextField
//             id="outlined-select-currency"
//             select
//             label="Select"
//             value={currency}
//             onChange={handleChange}
//             helperText="Please select your currency"
//           >
//             {currencies.map((option) => (
//               <MenuItem key={option.value} value={option.value}>
//                 {option.label}
//               </MenuItem>
//             ))}
//           </TextField>
//           <TextField
//             id="outlined-select-currency-native"
//             select
//             label="Native select"
//             value={currency}
//             onChange={handleChange}
//             SelectProps={{
//               native: true,
//             }}
//             helperText="Please select your currency"
//           >
//             {currencies.map((option) => (
//               <option key={option.value} value={option.value}>
//                 {option.label}
//               </option>
//             ))}
//           </TextField>
//         </div>
//         <div>
//           <TextField
//             id="filled-select-currency"
//             select
//             label="Select"
//             value={currency}
//             onChange={handleChange}
//             helperText="Please select your currency"
//             variant="filled"
//           >
//             {currencies.map((option) => (
//               <MenuItem key={option.value} value={option.value}>
//                 {option.label}
//               </MenuItem>
//             ))}
//           </TextField>
//           <TextField
//             id="filled-select-currency-native"
//             select
//             label="Native select"
//             value={currency}
//             onChange={handleChange}
//             SelectProps={{
//               native: true,
//             }}
//             helperText="Please select your currency"
//             variant="filled"
//           >
//             {currencies.map((option) => (
//               <option key={option.value} value={option.value}>
//                 {option.label}
//               </option>
//             ))}
//           </TextField>
//         </div>
//         <div>
//           <TextField
//             id="standard-select-currency"
//             select
//             label="Select"
//             value={currency}
//             onChange={handleChange}
//             helperText="Please select your currency"
//             variant="standard"
//           >
//             {currencies.map((option) => (
//               <MenuItem key={option.value} value={option.value}>
//                 {option.label}
//               </MenuItem>
//             ))}
//           </TextField>
//           <TextField
//             id="standard-select-currency-native"
//             select
//             label="Native select"
//             value={currency}
//             onChange={handleChange}
//             SelectProps={{
//               native: true,
//             }}
//             helperText="Please select your currency"
//             variant="standard"
//           >
//             {currencies.map((option) => (
//               <option key={option.value} value={option.value}>
//                 {option.label}
//               </option>
//             ))}
//           </TextField>
//         </div>
//       </Box>
//     );

import React, { Component } from 'react';
import styled from "@emotion/styled";
import axios from "axios"; 
// import Header from "../../components/Header";
const Container = styled.div`
  margin-top: 150px;
`;
class SubmitForm extends Component {
  state = {
    attrition: '',
    attrition_reason: '',
    empid: '',
    deptid: '',
    yearswihcurrentmanager: '',
    yearssincelastpromotion: '',
    result: ''
  };
/* This is where the magic happens 
*/
handleSubmit = event => {
    event.preventDefault();
    const body = {
      attrition: this.state.attrition,
      attrition_reason: this.state.attrition_reason,
      deptid: this.state.deptid,
      empid: this.state.empid,
      yearssincelastpromotion: this.state.yearssincelastpromotion,
      yearswithcurrentmanager: this.state.yearswithcurrentmanager
    }
    axios.post('http://127.0.0.1:5000/addEmployeeAttrition', body)
      .then(res=>{
        console.log(res);
        console.log(res.data);
        this.setState({result:`A row with following detaisl was added: , ${res.data}`})
        window.location = "/" //This line of code will redirect you once the submission is succeed
      })
      .catch(err=> {
        this.setState({result: 'There was an error in posting data!'});
      })
  }
// handleChange = event =>{
//     this.setState({ name: event.target.value});
//   }
render() {
    return (
      <Container>
        <h2>Add employee attrition</h2>
        {/* <Header/> */}
        <form onSubmit = { this.handleSubmit }>
          {/* <label> Attrition:
            <input type = "text" name = "attrition" onChange= {e => this.setState({attrition: e.target.value})}/>
          </label> */}
          <label> Attrition:
          <input type = "text" name = "attrition" onChange= {e => this.setState({attrition: e.target.value})}/>
         <br/>
          {/* <select name = "attrition">
            <option value = "YES" selected>Yes</option>
            <option value = "NO">No</option>
         </select> */}
         </label>
         <label> Attrition reason:
            <input type = "text" name = "attrition_reason" onChange= {e => this.setState({attrition_reason: e.target.value})}/>
         <br/>
         {/* <select name = "attrition_reason">
            <option value = "LONG WORKING HOURS">Long working hours</option>
            <option value = "ENVIRONMENT SATISFACTION">Environment dissatisfaction</option>
            <option value = "PERSONAL ISSUES">Personal issues</option>
            <option value = "LOW PAY">Low pay</option>
            <option value="LACK OF SKILL DEVELOPMENT">Lack of skill development</option>
         </select> */}
         </label>
          <label> Department id:
            <input type = "number" name = "deptid" onChange= {e => this.setState({deptid: e.target.value})}/>
          </label>
          <br/>
          <label> Employee id:
            <input type = "number" name = "empid" onChange= {e => this.setState({empid: e.target.value})}/>
          </label>
          <br/>
          <label> Years since last promotion:
            <input type = "number" name = "yearssincelastpromotion" onChange= {e => this.setState({yearssincelastpromotion: e.target.value})}/>
          </label>
          <br/>
          <label> Years with current manager:
            <input type = "number" name = "yearswithcurrentmanager" onChange= {e => this.setState({yearswithcurrentmanager: e.target.value})}/>
          </label>
          <br/>
          <button type = "submit"> Add </button>
        </form>

        <h3>{this.state.result}</h3>
    </Container>
    );
  }
}
export default SubmitForm;