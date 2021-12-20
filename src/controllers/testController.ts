import { Request, Response } from 'express';
import { TestEntity } from '../entities/TestEntity';
import { testBodySchema } from '../schemas/testSchema';
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


export async function RegisterTest(req: Request, res: Response) {
    const testBody: TestEntity = req.body;
    const invalidBody = testBodySchema.validate(testBody).error;

    if (invalidBody) {
        return res.status(400).send({message: 'favor, preencher direito os campos, há campos inválidos ->>' + invalidBody});
    }

    try {
        await testService.postTest(testBody);
        res.sendStatus(201);
    } catch (err) {
        res.sendStatus(500);
    }
}