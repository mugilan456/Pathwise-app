import 'package:student_guidance_platform/models/passed_out_student_model.dart';
import 'package:student_guidance_platform/models/current_student_model.dart';
import 'package:student_guidance_platform/models/exam_model.dart';
import 'package:student_guidance_platform/models/user_model.dart';

class MockDataProvider {
  static User getCurrentUser() {
    return User(
      id: '1',
      name: 'John Doe',
      email: 'john.doe@example.com',
      profileImage: 'https://api.dicebear.com/7.x/avataaars/svg?seed=John',
      bio: 'Computer Science Student | Tech Enthusiast',
    );
  }

  static List<PassedOutStudent> getPassedOutStudents() {
    return [
      PassedOutStudent(
        id: '1',
        name: 'Rajesh Kumar',
        currentCompany: 'Google',
        designation: 'Software Engineer',
        graduationYear: '2022',
        department: 'Computer Science',
        profileImage: 'https://api.dicebear.com/7.x/avataaars/svg?seed=Rajesh',
        story:
            'Graduated in 2022 and joined Google as SDE-1. My journey from campus to Google was challenging but rewarding.',
        skills: ['Python', 'Java', 'System Design', 'Cloud Computing'],
        rating: 4.8,
      ),
      PassedOutStudent(
        id: '2',
        name: 'Priya Sharma',
        currentCompany: 'Microsoft',
        designation: 'Senior Developer',
        graduationYear: '2021',
        department: 'Information Technology',
        profileImage: 'https://api.dicebear.com/7.x/avataaars/svg?seed=Priya',
        story:
            'Working as Senior Developer at Microsoft. Passionate about building scalable solutions.',
        skills: ['C#', '.NET', 'Azure', 'Leadership'],
        rating: 4.9,
      ),
      PassedOutStudent(
        id: '3',
        name: 'Amit Patel',
        currentCompany: 'Amazon',
        designation: 'Product Manager',
        graduationYear: '2020',
        department: 'Computer Science',
        profileImage: 'https://api.dicebear.com/7.x/avataaars/svg?seed=Amit',
        story:
            'Transitioned from engineering to product management at Amazon. Best decision ever!',
        skills: ['Product Strategy', 'Data Analysis', 'Leadership', 'AWS'],
        rating: 4.7,
      ),
      PassedOutStudent(
        id: '4',
        name: 'Neha Gupta',
        currentCompany: 'Goldman Sachs',
        designation: 'Quantitative Analyst',
        graduationYear: '2022',
        department: 'Mathematics & Computing',
        profileImage: 'https://api.dicebear.com/7.x/avataaars/svg?seed=Neha',
        story:
            'Specialized in quantitative analysis. Finance and technology is the future.',
        skills: ['Python', 'Machine Learning', 'Finance', 'Statistics'],
        rating: 4.9,
      ),
      PassedOutStudent(
        id: '5',
        name: 'Vikram Singh',
        currentCompany: 'Meta',
        designation: 'ML Engineer',
        graduationYear: '2021',
        department: 'Computer Science',
        profileImage: 'https://api.dicebear.com/7.x/avataaars/svg?seed=Vikram',
        story:
            'ML Engineer at Meta working on recommendation systems. AI is transforming everything.',
        skills: ['TensorFlow', 'PyTorch', 'Deep Learning', 'Data Science'],
        rating: 4.8,
      ),
    ];
  }

  static List<CurrentStudent> getCurrentStudents() {
    return [
      CurrentStudent(
        id: '1',
        name: 'Arjun Verma',
        semester: '6th Semester',
        department: 'Computer Science',
        cgpa: 8.5,
        profileImage: 'https://api.dicebear.com/7.x/avataaars/svg?seed=Arjun',
        bio: 'Passionate about web development and open source',
      ),
      CurrentStudent(
        id: '2',
        name: 'Sneha Desai',
        semester: '5th Semester',
        department: 'Information Technology',
        cgpa: 8.8,
        profileImage: 'https://api.dicebear.com/7.x/avataaars/svg?seed=Sneha',
        bio: 'Data science enthusiast and competitive programmer',
      ),
      CurrentStudent(
        id: '3',
        name: 'Rohit Malhotra',
        semester: '7th Semester',
        department: 'Computer Science',
        cgpa: 8.2,
        profileImage: 'https://api.dicebear.com/7.x/avataaars/svg?seed=Rohit',
        bio: 'Interested in cybersecurity and ethical hacking',
      ),
    ];
  }

  static List<Opportunity> getOpportunities() {
    return [
      Opportunity(
        id: '1',
        title: 'Software Development Internship',
        company: 'Google',
        type: 'Internship',
        description:
            'Work on cutting-edge technologies with the Google team. Build products that impact millions.',
        duration: '3 months',
        location: 'Bengaluru / Remote',
        stipend: '₹50,000/month',
        deadline: DateTime.now().add(const Duration(days: 30)),
        requirements: [
          'Strong programming skills',
          'Data Structures knowledge',
          'Problem solving ability'
        ],
        applicants: 2341,
      ),
      Opportunity(
        id: '2',
        title: 'Data Science Internship',
        company: 'Amazon',
        type: 'Internship',
        description:
            'Apply machine learning and statistics to solve real-world problems.',
        duration: '6 months',
        location: 'Hyderabad',
        stipend: '₹60,000/month',
        deadline: DateTime.now().add(const Duration(days: 45)),
        requirements: [
          'Python proficiency',
          'ML knowledge',
          'Statistics background'
        ],
        applicants: 1876,
      ),
      Opportunity(
        id: '3',
        title: 'Full Stack Development Workshop',
        company: 'Microsoft',
        type: 'Workshop',
        description: 'Learn modern web development stack from industry experts.',
        duration: '4 weeks',
        location: 'Online',
        stipend: 'Free',
        deadline: DateTime.now().add(const Duration(days: 15)),
        requirements: ['Basic programming knowledge', 'Enthusiasm to learn'],
        applicants: 4523,
      ),
      Opportunity(
        id: '4',
        title: 'Product Management Internship',
        company: 'Goldman Sachs',
        type: 'Internship',
        description: 'Shape the future of financial technology products.',
        duration: '3 months',
        location: 'Mumbai',
        stipend: '₹55,000/month',
        deadline: DateTime.now().add(const Duration(days: 20)),
        requirements: [
          'Analytical skills',
          'Communication ability',
          'Interest in fintech'
        ],
        applicants: 892,
      ),
      Opportunity(
        id: '5',
        title: 'AI/ML Research Internship',
        company: 'Meta',
        type: 'Internship',
        description:
            'Work on cutting-edge AI research projects that impact billions of users.',
        duration: '6 months',
        location: 'Remote',
        stipend: '₹70,000/month',
        deadline: DateTime.now().add(const Duration(days: 60)),
        requirements: [
          'Deep learning knowledge',
          'Research interest',
          'Strong math skills'
        ],
        applicants: 1345,
      ),
    ];
  }

  static List<Exam> getCompetitiveExams() {
    return [
      Exam(
        id: '1',
        name: 'GATE (CS)',
        organization: 'IIT',
        description: 'Graduate Aptitude Test in Engineering for Computer Science',
        examDate: DateTime(2024, 2, 3),
        registrationDeadline: '15 Nov 2024',
        eligibility: 'Bachelor\'s degree in Engineering/Technology',
        syllabus:
            'Algorithms, Data Structures, DBMS, OS, Networking, Digital Logic',
        examPattern: '3 hours, 65 questions, 100 marks',
        successTips: [
          'Focus on core concepts',
          'Solve previous year papers',
          'Join coaching or online courses'
        ],
        registeredCandidates: 145000,
      ),
      Exam(
        id: '2',
        name: 'CAT',
        organization: 'IIM',
        description: 'Common Admission Test for MBA programs',
        examDate: DateTime(2024, 11, 24),
        registrationDeadline: '15 Sep 2024',
        eligibility: 'Graduate in any discipline',
        syllabus: 'Quantitative Ability, VARC, LRDI',
        examPattern: '2 hours, MCQ and TITA questions',
        successTips: [
          'Time management is key',
          'Practice mock tests regularly',
          'Stay updated with current affairs'
        ],
        registeredCandidates: 234000,
      ),
      Exam(
        id: '3',
        name: 'NTA NET JRF',
        organization: 'NTA',
        description: 'National Eligibility Test for Junior Research Fellowship',
        examDate: DateTime(2024, 12, 15),
        registrationDeadline: '30 Oct 2024',
        eligibility: 'Master\'s degree or equivalent',
        syllabus: 'Subject specific + General Aptitude',
        examPattern: '3 hours, 100 MCQ questions',
        successTips: [
          'Study subject thoroughly',
          'Practice previous papers',
          'Join study groups'
        ],
        registeredCandidates: 89000,
      ),
      Exam(
        id: '4',
        name: 'UPSC IAS',
        organization: 'UPSC',
        description: 'Union Public Service Commission IAS Examination',
        examDate: DateTime(2024, 6, 1),
        registrationDeadline: '31 Mar 2024',
        eligibility: 'Indian citizen, Bachelor\'s degree',
        syllabus: 'GS, CSAT, Essay, Interview',
        examPattern: 'Preliminary, Main, and Interview',
        successTips: [
          'Read standard books',
          'Follow current affairs',
          'Practice answer writing'
        ],
        registeredCandidates: 1023000,
      ),
      Exam(
        id: '5',
        name: 'GRE',
        organization: 'ETS',
        description: 'Graduate Record Examination for US universities',
        examDate: DateTime(2024, 6, 15),
        registrationDeadline: 'Ongoing',
        eligibility: 'Bachelor\'s degree holder',
        syllabus: 'Verbal Reasoning, Quantitative, Analytical Writing',
        examPattern: '3 hours 45 minutes, adaptive test',
        successTips: [
          'Build vocabulary',
          'Master quantitative concepts',
          'Practice essays'
        ],
        registeredCandidates: 456000,
      ),
    ];
  }

  static List<MockTest> getMockTests() {
    return [
      MockTest(
        id: '1',
        title: 'GATE CS Full Mock Test 1',
        examName: 'GATE (CS)',
        difficulty: 'Hard',
        totalQuestions: 65,
        duration: 180,
        createdDate: DateTime.now().subtract(const Duration(days: 30)),
        attempts: 2341,
        averageScore: 68.5,
      ),
      MockTest(
        id: '2',
        title: 'CAT Mock Test Series - 3',
        examName: 'CAT',
        difficulty: 'Medium',
        totalQuestions: 76,
        duration: 120,
        createdDate: DateTime.now().subtract(const Duration(days: 15)),
        attempts: 5234,
        averageScore: 62.3,
      ),
      MockTest(
        id: '3',
        title: 'NET JRF Computer Science Test 2',
        examName: 'NTA NET JRF',
        difficulty: 'Hard',
        totalQuestions: 100,
        duration: 180,
        createdDate: DateTime.now().subtract(const Duration(days: 45)),
        attempts: 1876,
        averageScore: 55.8,
      ),
      MockTest(
        id: '4',
        title: 'GRE Mock Test Advanced',
        examName: 'GRE',
        difficulty: 'Hard',
        totalQuestions: 80,
        duration: 225,
        createdDate: DateTime.now().subtract(const Duration(days: 20)),
        attempts: 3421,
        averageScore: 72.1,
      ),
    ];
  }
}
