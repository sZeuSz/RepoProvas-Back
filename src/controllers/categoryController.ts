import { Request, Response } from 'express';
import * as categoryService from '../services/categoryService';
export async function getCategories(req: Request, res: Response) {
    
    try {

        const categories = await categoryService.getCategories();

        return res.send(categories);
        
    } catch (error) {
        console.log(error);
        return res.sendStatus(500);
    }
}

export async function getCategoriesWithTests(req: Request, res: Response) {
    const { id } = req.params;

    try {

        if (!id) {
            return res.status(400).send({message:'Parâmetro inválido.'})
        }
        const categoriesWithTests = await categoryService.getCategoriesWithTestsByIdProfessor(id);

        return res.send(categoriesWithTests);
    } catch (error) {
        console.log(error);
        return res.sendStatus(500);
    }
}