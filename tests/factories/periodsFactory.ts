import faker from 'faker';

export function generatePeriods() {

    return {
        name: faker.name.findName()
    }
}