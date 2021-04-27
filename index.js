const inquirer = require("inquirer");
const mysql = require("mysql");

const connection = mysql.createConnection({
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: 'password',
    database: 'employees_db',
  });
  
  //function to run when 
  function mainMenu(){
        inquirer
          .prompt({
            name: 'action',
            type: 'list',
            message: 'What would you like to do?',
            choices: [
              'Add Department',
              'Add Role',
              'Add Employee',
              'View Departments',
              'View Roles',
              'View Employees',
              'Update Employee Roles',
            ],
          })
          .then((answer) => {
            switch (answer.action) {
              case 'Add Department':
                addDepartment();
                break;
      
              case 'Add Role':
                addRole();
                break;
      
              case 'Add Employee':
                addEmployee();
                break;
      
              case 'View Departments':
                viewDepartment();
                break;
      
              case 'View Roles':
                viewRoles();
                break;
                
            case 'View Employees':
                viewEmployees();
                break;
            
            case 'Update Employee Roles':
                updateRole();
                break;


              default:
                console.log(`Invalid action: ${answer.action}`);
                break;
            }
          });
      };

function viewDepartment() {
    connection.query(`SELECT * FROM employees_db.department`, function(err, res) {
            if (err) throw err;
            console.table(res);
            mainMenu();
        });
      }

function addDepartment(){
    inquirer
    .prompt({
      name: 'newdepartment',
      type: 'input',
      message: 'What department would you like to add?',
    })
    .then((answer) => {
        console.log('adding new department...\n');
        const query = connection.query(
          'INSERT INTO department SET ?',
          {
            name: answer.newdepartment
          },
          (err, res) => {
            if (err) throw err;
            console.log(`${res.affectedRows} Department Added!\n`);
            viewDepartment();
          }
        );
        console.log(query.sql);
      
    });
};


function viewRoles() {
    connection.query(`SELECT * FROM employees_db.roles`, function(err, res) {
            if (err) throw err;
            console.table(res);
            mainMenu();
        });
      }


function addRole(){
    connection.query(`SELECT * FROM employees_db.roles`, function(err, res) {
        if (err) throw err;
        const rolesArray = res.map(function(roles){
            return roles.title
        })
        console.table(res);


        inquirer
        .prompt({
          name: 'newrole',
          type: 'input',
          message: 'What role would you like to add?',
        },
        {
            name: 'salary',
            type: 'input',
            message: 'what is the salary for this role?',
          },
          {
            name: 'department',
            type: 'list',
            message: 'what department is this role in?',
            choices: rolesArray
          }
        
        
        )
        .then((answer) => {
            console.log('adding new department...\n');
            const query = connection.query(
              'INSERT INTO department SET ?',
              {
                name: answer.newdepartment
              },
              (err, res) => {
                if (err) throw err;
                console.log(`${res.affectedRows} Department Added!\n`);
                viewDepartment();
              }
            );
            console.log(query.sql);
          
        });
        mainMenu();
    });

    
    };
    

  connection.connect((err) => {
    if (err) throw err;
    mainMenu();
  });

