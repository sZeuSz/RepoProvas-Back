import { getRepository } from "typeorm";
import { PeriodEntity } from "../entities/PeriodEntity";


export async function getPeriodsWithDisciplines() {
  const result = await getRepository(PeriodEntity).find({ relations: ["disciplines"] });
  return result;
}