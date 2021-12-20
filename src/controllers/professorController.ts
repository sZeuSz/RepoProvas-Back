import { Request, Response } from 'express';
import * as professorService from '../services/professorService';
export async function getProfessors(req: Request, res: Response) {
    
    try {
        const professors = await professorService.getProfessors();

        return res.send(professors);
        
    } catch (error) {
        console.log(error);
        return res.sendStatus(500);
    }
}