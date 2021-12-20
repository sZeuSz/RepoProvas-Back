import "./setup";

import express from "express";
import cors from "cors";
import "reflect-metadata";

import connectDatabase from "./database";

import * as categoryController from "./controllers/categoryController";
import * as professorController from "./controllers/professorController";
import * as disciplineController from './controllers/disciplineController';
import * as testsController from './controllers/testController';

const app = express();

app.use(cors());
app.use(express.json());

app.get('/categories', categoryController.getCategories);
app.get('/professors', professorController.getProfessors);
app.get('/professors/:id/tests-by-categories', categoryController.getCategoriesWithTests);
app.get('/disciplines', disciplineController.getDisciplines);
app.get('/disciplines/:id/tests', testsController.getTests);
app.post('/tests', testsController.RegisterTest);
export async function init () {
  await connectDatabase();
}

export default app;
