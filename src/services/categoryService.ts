import { getManager, getRepository } from "typeorm";
import { CategoryEntity } from "../entities/CategoryEntity";

export async function getCategories() {
    const categories = await getRepository(CategoryEntity).find();

    return categories;
}

export async function getCategoriesWithTestsByIdProfessor(id: string) {
    const result = await getRepository(CategoryEntity)
        .createQueryBuilder('category')
        .leftJoinAndSelect('category.tests', 'tests')
        .leftJoinAndSelect('tests.professor', 'professor')
        .leftJoinAndSelect('tests.discipline', 'discipline')
        .where('tests.professor.id = :id', {id: id})
        .getMany();
    return result;
}