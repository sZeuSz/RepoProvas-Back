import '../../src/setup';
import supertest from 'supertest';
import app from '../../src/app';
import { init as inicialize } from '../../src/app';
import { getConnection, getRepository } from 'typeorm';
import { mockDisciplines } from '../mockeds/disciplineMock';
import { DisciplineEntity } from '../../src/entities/DisciplineEntity';
import { PeriodEntity } from '../../src/entities/PeriodEntity';
import { generateDiscipline } from '../factories/disciplinesFactory';

beforeAll(async () => {
    await inicialize();
    await getRepository(PeriodEntity).delete({});
    await getRepository(DisciplineEntity).delete({});
})

afterAll(async () => {
    await getConnection().close();
}) 


describe('Routes /disciplines', () => {


    beforeEach(async () => {
        const periods = getRepository(PeriodEntity).create([
            { name: '1°' },
            { name: '2°' },
            { name: '3°' },
            { name: '4°' },
            { name: '5°' },
            { name: '6°' },
            { name: '7°' },
            { name: '8°' },
        ]);
        const savePeriods = await getRepository(PeriodEntity).save(periods);

        const disciplines = getRepository(DisciplineEntity).create({ name: generateDiscipline().name, period: savePeriods[0] })
        
        const saveDisciplines = await getRepository(DisciplineEntity).save(disciplines);

    })

    afterEach(async () => {
        await getRepository(PeriodEntity).delete({});
        await getRepository(DisciplineEntity).delete({});
    })

    test('should return subject array with exams when getSubjectsWithExams', async () => {
        console.log("baby", await getRepository(PeriodEntity).find());
        
        console.log('disciplines', await getRepository(DisciplineEntity).find());
        const result = await supertest(app).get('/disciplines');
        console.log("result.body", result.body);
        console.log('resul.stauts', result.status);
        expect(result.status).toEqual(200);
        expect(result.body).toEqual(mockDisciplines);
    });
})
