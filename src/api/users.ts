// users.ts - The router for the users model in our API

// Import dependencies
import express, { Response } from 'express';
import { PrismaClient } from '@prisma/client';
import { jwtVerify } from '@kinde-oss/kinde-node-express';
import getUser from '../services/UserServices';

const verifier = jwtVerify(process.env.KINDE_URL!, {
  audience: '', //I know this seems odd, but audiences are not configured on kinde and as a result this works
});

// Create the router
const users = express.Router();

const prisma = new PrismaClient();

// Routes go here (get, post, put, delete)

if (process.env.ENVIRONMENT !== 'dev') {
  users.use(verifier);
}

users.get('/', async (req, res) => {
  try {
    const user = await getUser(req);

    user.id = 1; //Security decision and everyone will think theyre the first user :)
    res.json(user);
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: 'Internal Server Error' });
  }
});

users.put('/bio', async (req, res) => {
  const bio = req.body.bio;
  const user = await getUser(req);

  try {
    const modifiedUser = prisma.user.update({
      where: {
        id: user.id,
      },
      data: {
        bio,
      },
    });

    res.status(201).json(modifiedUser);
  } catch (err) {
    console.log(err);
    res.status(500).json({ message: 'Internal Server Error' });
  }
});

users.put('/profilepicture', async (req, res) => {
  const profilePicture = req.body.profilePicture;
  const user = await getUser(req);

  try {
    const modifiedUser = prisma.user.update({
      where: {
        id: user.id,
      },
      data: {
        profilePicture,
      },
    });

    res.status(201).json(modifiedUser);
  } catch (err) {
    console.log(err);
    res.status(500).json({ message: 'Internal Server Error' });
  }
});

users.put('/username', async (req, res) => {
  const username = req.body.username;
  const user = await getUser(req);

  try {
    const modifiedUser = prisma.user.update({
      where: {
        id: user.id,
      },
      data: {
        username,
      },
    });

    res.status(201).json(modifiedUser);
  } catch (err) {
    console.log(err);
    res.status(500).json({ message: 'Internal Server Error' });
  }
});

// Export the router for use in the app.
export default users;
