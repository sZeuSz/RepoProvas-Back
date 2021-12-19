import { getManager, getRepository } from "typeorm";
import { CategoryEntity } from "../entities/CategoryEntity";

export async function getCategories() {
    const categories = await getRepository(CategoryEntity).find();

    return categories;
}

export async function getCategoriesWithTests() {
    const categoriesWithTests = await getRepository(CategoryEntity).find({
        relations: ['tests'],
    });

    return categoriesWithTests.map((e) => e.getCategory());
}