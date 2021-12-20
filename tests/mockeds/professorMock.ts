export const mockProfessor = [
  {
    id: expect.any(Number),
    name: expect.any(String)
  }
]

export const mockProfessorWithDisciplineAndTest = [
  {
    id: expect.any(Number),
    name: expect.any(String),
    tests: [
            {
                id: expect.any(Number),
                name: expect.any(String),
                link: expect.any(String),
                professor: {
                    id: expect.any(Number),
                    name: expect.any(String),
                },
                discipline: {
                    id: expect.any(Number),
                    name: expect.any(String),
                }
            }
        ]
  }
]