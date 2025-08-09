#!/bin/bash

# Programming Handbook Repository Setup Script
# Usage: ./setup-programming-handbook.sh [directory-name]

set -e  # Exit on any error

# Get directory name from argument or use default
REPO_NAME=${1:-"programming-handbook"}
BASE_DIR=$(pwd)/$REPO_NAME

echo "🚀 Setting up Programming Handbook repository: $REPO_NAME"

# Create main directory
mkdir -p "$BASE_DIR"
cd "$BASE_DIR"

echo "📁 Creating directory structure..."

# Create main directories
mkdir -p daily-learnings/2025/{01-january,02-february,03-march,04-april,05-may,06-june,07-july,08-august,09-september,10-october,11-november,12-december}

mkdir -p topics/{languages,frameworks,databases,devops,algorithms,system-design}
mkdir -p topics/languages/{javascript,python,rust,go,typescript,java}
mkdir -p topics/frameworks/{react,vue,angular,django,flask,express,spring}
mkdir -p topics/databases/{sql,nosql,redis,elasticsearch}
mkdir -p topics/devops/{docker,kubernetes,aws,ci-cd,monitoring}

mkdir -p resources
mkdir -p projects/{small-projects,case-studies}
mkdir -p templates

echo "📝 Creating template files..."

# Create main README.md
cat > README.md << 'EOF'
# Programming Handbook

A personal collection of programming knowledge, daily learnings, and resources accumulated throughout my professional journey.

## 🎯 Purpose

- Track daily learning progress
- Organize knowledge by topics
- Serve as a reference for future projects
- Help mentor others in their programming journey

## 📚 Structure

- **daily-learnings/**: Daily entries of what I learned
- **topics/**: Organized deep-dives into specific subjects
- **resources/**: Curated lists of books, courses, tools, and blogs
- **projects/**: Small projects and case studies
- **templates/**: Templates for consistent documentation

## 🗓️ Daily Learning Format

Each day I try to learn something new and document it. Even small insights count!

## 🔍 How to Navigate

- Start with daily learnings to see the chronological journey
- Browse topics for deep knowledge on specific subjects
- Check resources for recommended materials
- Look at projects for practical applications

## 🤝 Contributing

This is primarily a personal handbook, but if you find it useful and want to suggest improvements or corrections, feel free to open an issue!

---
*"Learning never exhausts the mind." - Leonardo da Vinci*
EOF

# Create daily entry template
cat > templates/daily-entry.md << 'EOF'
# [Date - e.g., January 15, 2025]

## What I Learned Today

### [Topic/Technology Name]
- **Main Concept**: Brief description of what you learned
- **Source**: [Link to video/article/course](URL)
- **Key Insights**:
  - Insight 1
  - Insight 2
  - Insight 3

## Code Examples

```language
// Add any code snippets you tried or learned about
function example() {
    return "Hello, World!";
}
```

## Connections & Reflections

- How does this connect to what I already know?
- Where might I apply this in future projects?
- Questions that arose from this learning?

## Action Items

- [ ] Thing to try tomorrow
- [ ] Concept to research further
- [ ] Project idea sparked by today's learning

---
**Learning Time**: X minutes
**Difficulty**: Beginner/Intermediate/Advanced
**Would Recommend**: Yes/No
EOF

# Create topic template
cat > templates/topic-template.md << 'EOF'
# [Topic Name]

## Overview
Brief description of what this topic covers.

## Prerequisites
- What you should know before diving into this topic
- Links to foundational concepts

## Key Concepts

### Concept 1
Explanation with examples

### Concept 2
Explanation with examples

## Code Examples

```language
// Practical examples
```

## Common Patterns/Best Practices

- Pattern 1: Description
- Pattern 2: Description

## Gotchas & Pitfalls

- Common mistake 1
- Common mistake 2

## Resources

### Learning Materials
- [Resource 1](URL) - Description
- [Resource 2](URL) - Description

### Documentation
- [Official Docs](URL)

### Tools
- Tool 1: Description
- Tool 2: Description

## Related Topics
- [Related Topic 1](../path/to/topic)
- [Related Topic 2](../path/to/topic)

## Projects Using This
- [Project 1](../projects/project-name)

---
**Difficulty Level**: Beginner/Intermediate/Advanced
**Last Updated**: [Date]
EOF

# Create resource files
cat > resources/books.md << 'EOF'
# Books

## Programming Fundamentals
- [ ] **Clean Code** by Robert Martin
- [ ] **The Pragmatic Programmer** by Hunt & Thomas

## Algorithms & Data Structures
- [ ] **Introduction to Algorithms** by Cormen, Leiserson, Rivest, Stein

## System Design
- [ ] **Designing Data-Intensive Applications** by Martin Kleppmann

## Language Specific

### JavaScript
- [ ] **You Don't Know JS** series by Kyle Simpson

### Python
- [ ] **Effective Python** by Brett Slatkin

---
**Legend**: ✅ Read | 📚 Currently Reading | 📝 Taking Notes
EOF

cat > resources/courses.md << 'EOF'
# Online Courses

## Platforms
- **Coursera**: University-level courses
- **Udemy**: Practical, project-based learning
- **Pluralsight**: Technology-focused training
- **YouTube**: Free tutorials and deep dives

## Completed Courses
- [ ] Course Name - Platform - Completion Date

## Currently Taking
- [ ] Course Name - Platform - Progress: X%

## Wishlist
- [ ] Course Name - Platform - Priority: High/Medium/Low

---
**Rating System**: ⭐⭐⭐⭐⭐ (5 stars max)
EOF

cat > resources/blogs.md << 'EOF'
# Blogs & Websites

## Daily Reads
- [Hacker News](https://news.ycombinator.com/) - Tech news and discussions
- [Dev.to](https://dev.to/) - Developer community and articles

## Weekly Reads
- [Martin Fowler's Blog](https://martinfowler.com/) - Software architecture
- [Joel on Software](https://www.joelonsoftware.com/) - Software development insights

## Language/Framework Specific

### JavaScript
- [JavaScript Weekly](https://javascriptweekly.com/)

### Python
- [Real Python](https://realpython.com/)

## Podcasts
- [ ] Podcast Name - Episode that stood out

---
**Personal Favorites**: ⭐ Mark your most valuable sources
EOF

cat > resources/tools.md << 'EOF'
# Development Tools

## Editors & IDEs
- **VS Code**: Primary editor with essential extensions
- **IntelliJ**: For Java/Kotlin development

## Version Control
- **Git**: Essential commands and workflows
- **GitHub**: Repository hosting and collaboration

## Command Line Tools
- **Terminal**: Productivity shortcuts and aliases
- **Homebrew**: Package management for macOS

## Browser Dev Tools
- **Chrome DevTools**: Debugging and performance analysis

## Design & Mockup
- **Figma**: UI/UX design and prototyping

## Productivity
- **Notion**: Documentation and project planning
- **Alfred**: macOS productivity booster

---
**Setup Notes**: Include configuration files and custom settings
EOF

# Create current month directory and first entry
CURRENT_MONTH=$(date +"%m-%B" | tr '[:upper:]' '[:lower:]')
CURRENT_DATE=$(date +"%Y-%m-%d")
TODAY_FILE="daily-learnings/2025/$CURRENT_MONTH/$CURRENT_DATE.md"

mkdir -p "daily-learnings/2025/$CURRENT_MONTH"

# Create today's entry
FORMATTED_DATE=$(date +"%B %d, %Y")
cat > "$TODAY_FILE" << EOF
# $FORMATTED_DATE

## What I Learned Today

### Setting Up My Programming Handbook
- **Main Concept**: Created a structured repository for tracking daily learning
- **Source**: Personal project setup
- **Key Insights**:
  - Consistency in documentation is more important than perfection
  - Having templates makes daily entries easier
  - Organizing by both time and topic allows different ways to access knowledge

## Reflections

This is the beginning of my systematic approach to tracking professional growth. Looking forward to seeing how this evolves!

## Action Items

- [ ] Make first real learning entry tomorrow
- [ ] Set up daily reminder to update handbook
- [ ] Choose first topic to deep-dive into

---
**Learning Time**: 30 minutes
**Difficulty**: Beginner
**Would Recommend**: Yes - great for building learning habits
EOF

# Create sample topic files
cat > topics/languages/javascript/README.md << 'EOF'
# JavaScript

My journey learning and mastering JavaScript - from basics to advanced concepts.

## Subtopics

- [ES6+ Features](./es6-features.md)
- [Async Programming](./async-programming.md)
- [DOM Manipulation](./dom-manipulation.md)
- [Testing](./testing.md)

## Progress Tracking

- [ ] Variables and Data Types
- [ ] Functions and Scope
- [ ] Objects and Prototypes
- [ ] ES6+ Features
- [ ] Async/Await
- [ ] Testing Frameworks
- [ ] Performance Optimization

## Projects
- Link to projects where I've applied JavaScript concepts
EOF

# Initialize git repository
git init
git add .
git commit -m "Initial setup of programming handbook

- Created directory structure for daily learnings and topics
- Added templates for consistent documentation
- Set up resource tracking for books, courses, blogs, and tools
- Created first daily entry for $(date +"%Y-%m-%d")"

echo "✅ Repository structure created successfully!"
echo ""
echo "📍 Location: $BASE_DIR"
echo ""
echo "🎯 Next steps:"
echo "   1. cd $REPO_NAME"
echo "   2. Start your first daily entry in: $TODAY_FILE"
echo "   3. Add remote origin: git remote add origin <your-github-repo-url>"
echo "   4. Push to GitHub: git push -u origin main"
echo ""
echo "💡 Pro tip: Set up a daily reminder to update your handbook!"
echo ""
echo "Happy learning! 🚀"