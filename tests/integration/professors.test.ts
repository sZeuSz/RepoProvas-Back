import '../../src/setup';
import supertest from 'supertest';
import app from '../../src/app';
import { init as inicialize } from '../../src/app';
import { getConnection, getRepository } from 'typeorm';
import { mockDisciplines } from '../mockeds/disciplineMock';
import { DisciplineEntity } from '../../src/entities/DisciplineEntity';
import { PeriodEntity } from '../../src/entities/PeriodEntity';
import { generateDiscipline } from '../factories/disciplinesFactory';
import { ProfessorEntity } from '../../src/entities/ProfessorEntity';
import { generateProfessor } from '../factories/professorFactory';
import { mockProfessor } from '../mockeds/professorMock';

beforeAll(async () => {
    await inicialize();
    await getRepository(ProfessorEntity).delete({});
})

afterAll(async () => {
    await getConnection().close();
}) 


describe('Routes /professors', () => {

    beforeEach(async () => {
        const professor = getRepository(ProfessorEntity).create(generateProfessor());

        const saveProfessor = await getRepository(ProfessorEntity).save(professor);
    })
    
    afterEach(async () => {
        await getRepository(ProfessorEntity).delete({})
    })

    test('should returns a status code of 200 and an array with expected types equal in mockProfessor', async () => {
        
        console.log('profesors', await getRepository(ProfessorEntity).find());
        const result = await supertest(app).get('/professors');
        console.log("result.body", result.body);
        console.log('resul.stauts', result.status);
        expect(result.status).toEqual(200);
        expect(result.body).toEqual(mockProfessor);
    });
})
