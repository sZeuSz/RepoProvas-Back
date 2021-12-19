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
    try {
        const categoriesWithTests = await categoryService.getCategoriesWithTests();

        return res.send(categoriesWithTests);
    } catch (error) {
        console.log(error);
        return res.sendStatus(500);
    }
}