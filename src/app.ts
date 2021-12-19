import "./setup";

import express from "express";
import cors from "cors";
import "reflect-metadata";

import connectDatabase from "./database";

import * as userController from "./controllers/userConroller";
import * as categoryController from "./controllers/categoryController";
import * as professorController from "./controllers/professorController";
import * as disciplineController from './controllers/disciplineController';
const app = express();

app.use(cors());
app.use(express.json());

app.get("/users", userController.getUsers);
app.get('/categories', categoryController.getCategories);
app.get('/professors', professorController.getProfessors);
app.get('/tests-by-categories', categoryController.getCategoriesWithTests);
app.get('/disciplines', disciplineController.getDisciplines);
export async function init () {
  await connectDatabase();
}

export default app;