
courses = [

{:course_num => 'COMS W1004', :dept => 'Computer Science', :course_name => 'Intro to Computer Science', :professor => 'Adam Cannon', :requirement => 'Major Core', :course_time => 'TR 4:10pm-5:25pm'},

{:course_num => 'COMS W3107', :dept => 'Computer Science', :course_name => 'Clean Object-Oriented Design', :professor => 'John Kender', :requirement => 'General Technical Requirement', :course_time => 'MW 1:10pm-2:25pm'},

{:course_num => 'COMS W3108', :dept => 'Computer Science', :course_name => 'Clean Object-Oriented Design session 2', :professor => 'Adam Cannon', :requirement => 'General Technical Requirement', :course_time => 'MW 1:10pm-2:25pm'},
    
{:course_num => 'COMS W3134', :dept => 'Computer Science', :course_name => 'Data Structures in Java', :professor => 'Paul Blaer', :requirement => 'Major Core', :course_time => 'MW 5:40pm-6:55pm'},


{:course_num => 'COMS W4771', :dept => 'Computer Science', :course_name => 'Machine Learning', :professor => 'Nakul Verma', :requirement => 'Track Course', :course_time => 'TR 1:10pm-2:25pm'},

{:course_num => 'COMS W4772', :dept => 'Computer Science', :course_name => 'Machine Learning-2', :professor => 'Joshua B Gordon', :requirement => 'Track Course', :course_time => 'TR 1:10pm-2:25pm'},


{:course_num => 'COMS W4995', :dept => 'Computer Science', :course_name => 'Topics in Computer Science: Applied Deep Learning', :professor => 'Joshua B Gordon', :requirement => 'General Technical Elective', :course_time => 'R 7:00pm-9:30pm'},

{:course_num => 'CHEN E4670', :dept => 'Chemical Engineering', :course_name => 'Chemical Engineering Data Analysis', :professor => 'Kyle Bishop', :requirement => 'Major Core', :course_time => 'TTh 10:10pm-12:40pm'},

{:course_num => 'CHEN E4910', :dept => 'Chemical Engineering', :course_name => 'Solid State Chemistry In Pharmecutical', :professor => 'Aaron Moment', :requirement => 'General Technical Elective', :course_time => 'TTh 10:10pm-12:40pm'},    
    
	]

coursedetails = [
    {:number => 'COMS W1004', :points => '3', :coursetype =>'LECTURE', :method_of_inst =>'On-Line Only', :detail => 'A general introduction to computer science for science and engineering students interested in majoring in computer science or engineering. Covers fundamental concepts of computer science, algorithmic problem-solving capabilities, and introductory Java programming skills. Assumes no prior programming background. Columbia University students may receive credit for only one of the following two courses: 1004 or 1005.'},
    {:number => 'COMS W3107', :points => '3', :coursetype =>'LECTURE', :method_of_inst =>'On-Line Only', :detail => "A course in designing, documenting, coding, and testing robust computer software, according to object-oriented design patterns and clean coding practices. Taught in Java.Object-oriented design principles include: use cases; CRC; UML; javadoc; patterns (adapter, builder, command, composite, decorator, facade, factory, iterator, lazy evaluation, observer, singleton, strategy, template, visitor); design by contract; loop invariants; interfaces and inheritance hierarchies; anonymous classes and null objects; graphical widgets; events and listeners; Java's Object class; generic types; reflection; timers, threads, and locks."},
    {:number => 'COMS W3134', :points => '3', :coursetype =>'LECTURE', :method_of_inst =>'On-Line Only', :detail => 'Prerequisites: (COMS W1004) or knowledge of Java. Data types and structures: arrays, stacks, singly and doubly linked lists, queues, trees, sets, and graphs. Programming techniques for processing such structures: sorting and searching, hashing, garbage collection. Storage management. Rudiments of the analysis of algorithms. Taught in Java. Note: Due to significant overlap, students may receive credit for only one of the following three courses: COMS W3134, COMS W3136, COMS W3137.'},
    {:number => 'COMS W4771', :points => '3', :coursetype =>'LECTURE', :method_of_inst =>'On-Line Only', :detail => 'Prerequisites: Any introductory course in linear algebra and any introductory course in statistics are both required. Highly recommended: COMS W4701 or knowledge of Artificial Intelligence. Topics from generative and discriminative machine learning including least squares methods, support vector machines, kernel methods, neural networks, Gaussian distributions, linear classification, linear regression, maximum likelihood, exponential family distributions, Bayesian networks, Bayesian inference, mixture models, the EM algorithm, graphical models and hidden Markov models. Algorithms implemented in MATLAB.'},
    {:number => 'COMS W4995', :points => '3', :coursetype =>'LECTURE', :method_of_inst =>'On-Line Only', :detail => "Prerequisites: Instructor's permission. Special topics arranged as the need and availability arises. Topics are usually offered on a one-time basis. Since the content of this course changes each time it is offered, it may be repeated for credit. Consult the department for section assignment."},
    {:number => 'CHEN E4670', :points => '3', :coursetype =>'LECTURE', :method_of_inst =>'Hybrid', :detail => 'Prerequisites: (CHEN E4230) and (CHEN E3120) and (CHEN E3210) or'},
    {:number => 'CHEN E4910', :points => '3', :coursetype =>'LECTURE', :method_of_inst =>'In-Person', :detail => 'Prerequisites: Pre-requisites: Thermodynamics (any), or General Chemistry Students must be engineering juniors or seniors, engineering graduate students, or PhD and undergraduate students in the sciences, e.g. chemistry or biology.'}
    ]

users = [
    {:username => 'hp2581@columbia.edu', :password => 'Abc567*'},
    {:username => 'jp4024@columbia.edu', :password => '123'},
    {:username => 'rc3374@columbia.edu', :password => '123'}
]

users.each do |user|
  User.create!(user)
end

courses.each do |course|
  Course.create!(course)
end

coursedetails.each do |coursedetail|
  Coursedetails.create!(coursedetail)
end
