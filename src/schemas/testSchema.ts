import Joi from 'joi';

const testBodySchema = Joi.object({
    name: Joi.string().required().trim(),
    pdfLink: Joi.string().required().trim().regex(/[^.]\.(pdf)/),
    category: Joi.number().required(),
    subject: Joi.number().required(),
    professor: Joi.number().required(),
});

export {
    testBodySchema,
};