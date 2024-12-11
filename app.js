const express = require ('express');
const bodyParser = require('body-parser');

const authRoutes = require('./routes/authRoutes');
const userRoutes = require('./routes/userRoutes');
const deptRoutes = require('./routes/deptRoutes');
const coursesRoutes = require('./routes/coursesRoutes');
const studentRoutes = require('./routes/studentRoutes');

const app = express();
app.use(bodyParser.json());
const cors = require ('cors');
app.use(cors());

app.get('/', function(req, res){
    res.send("Zacharyyuri berunio");
});

app.use('/api/auth', authRoutes);
app.use('/api/user', userRoutes);
app.use('/api/dept', deptRoutes);
app.use('/api/courses', coursesRoutes);
app.use('/api/student', studentRoutes);

const PORT = process.env.PORT || 5000;

app.listen(PORT, () => {
     console.log(`Server is running on port ${PORT}`);
});

