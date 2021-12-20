import { Request, Response } from 'express';
import * as testService from '../services/testService';

export async function getTests(req: Request, res: Response) {
    
    const { id } = req.params;

    try {
        if (!id) {
            return res.status(400).send({message:'Parâmetro inválido.'})
        }

        const categories = await testService.getTestsByDisciplineId(id);

        if (!categories) {
            return res.status(404).send({message: 'não foi possivel encontrar as disciplinas desse ID'})
        }
        return res.send(categories);
        
    } catch (error) {
        console.log(error);
        return res.sendStatus(500);
    }
}