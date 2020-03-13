import { Router } from  'express';

import employeeController from '../controllers/employeeController';

class EmployeeRoutes {
 
   public router: Router = Router();

   constructor() {
       this.config();

   }

   config(): void {
       this.router.get('/', employeeController.list);
       this.router.get('/:id', employeeController.getOne);
       this.router.post('/', employeeController.create);
       this.router.put('/', employeeController.update);
       this.router.delete('/:id', employeeController.delete);
   }

}

const employeeRoutes = new EmployeeRoutes();
export default employeeRoutes.router;