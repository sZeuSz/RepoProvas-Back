import { getManager, getRepository } from "typeorm";
import { CategoryEntity } from "../entities/CategoryEntity";
import { ProfessorEntity } from "../entities/ProfessorEntity";

export async function getProfessors() {
    const professors = await getRepository(ProfessorEntity).find();

    return professors;
}

export async function getProfessorsWithTests() {

    const professorsWithTests = await getRepository(ProfessorEntity).find();
    return professorsWithTests;
}