import { getManager, getRepository } from "typeorm";
import { TestEntity } from "../entities/TestEntity";
import { CategoryEntity } from "../entities/CategoryEntity";

export async function getTestsByDisciplineId(id: string) {
    // const testsByDisciplineId = await getRepository(TestEntity).find({id:1});
    const result = await getRepository(CategoryEntity)
        .createQueryBuilder('category')
        .leftJoinAndSelect('category.tests', 'tests')
        .leftJoinAndSelect('tests.professor', 'professor')
        .where('tests.discipline.id = :id', {id: id})
        .getMany();
    return result;
}

/*
export async function getTestsByDisciplineId(id: string) {
    // const testsByDisciplineId = await getRepository(TestEntity).find({id:1});
    const result = await getRepository(TestEntity)
        .createQueryBuilder('tests')
        .leftJoinAndSelect('tests.discipline', 'discipline')
        .leftJoinAndSelect('tests.professor', 'professor')
        .leftJoinAndSelect('tests.category', 'category')
        .where('discipline.id = :value', {value: 1})
        .getMany();
    return result;
}*/