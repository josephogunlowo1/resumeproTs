import {Request, Response} from 'express';

import pool from '../database'

class EmployeeController {


    public async list (req: Request, res:Response) {
        const employee =  (await pool).query('SELECT * FROM employee');
        res.json(employee);
    }

    public async getOne (req: Request, res:Response): Promise<any>{
        const { id } = req.params;
        (await pool).query('SELECT * FROM employee WHERE id = ?', [id]);
       // if(employee.length > 0) {
       //     return res.json(employee[0]);
       // }
        res.status(404).json({text: 'The game doesn\'t exist'})
    }
    
    public async create (req: Request, res:Response):Promise<void> {
        (await pool).query('INSERT INTO employee set ?', [req.body])
        res.json({message: 'employee saved'});
    }

    public async update (req: Request, res:Response): Promise<void> {
        const { id }:any = req.param;
        (await pool).query('UPDATE employee set ? WHERE ID = ? ', [req.body, id]);
        res.json({message: 'employee update'});
    }

    public async delete (req: Request, res:Response): Promise<void>{
        const { id } = req.params;
        (await pool).query('DELETE * FROM employee WHERE id = ?', [id]);

        res.json({text: 'Employee was deleted' + req.params.id});
    }



}

const employeeController = new EmployeeController();
export default employeeController; 