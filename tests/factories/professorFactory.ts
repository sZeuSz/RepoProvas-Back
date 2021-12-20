import faker  from "faker";

export function generateProfessor() {
    
    return {
        name: faker.name.findName()
    }
}