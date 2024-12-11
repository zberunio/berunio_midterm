const express = require ('express');
const authenticateToken = require('../middleware/authMiddleware');
const {getAllCourses, getCoursesById, createCourses, updateCourse, deleteCourses} = require('../controllers/coursesController');


const router = express.Router();

router.get('/', authenticateToken, getAllCourses);
router.get('/:id', authenticateToken, getCoursesById);
router.post('/', authenticateToken, createCourses);
router.put('/:id', authenticateToken, updateCourse);
router.delete('/:id', authenticateToken, deleteCourses);

module.exports = router;