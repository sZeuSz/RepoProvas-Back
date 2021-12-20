import * as disciplineService from '../services/disciplineService';
import { Request, Response } from 'express';
export async function getDisciplines(req: Request, res: Response) {
  try {
    const periods = await disciplineService.getPeriodsWithDisciplines();
    return res.status(200).send(periods);
  } catch (err) {
    console.error(err);
    res.sendStatus(500);
  }
}