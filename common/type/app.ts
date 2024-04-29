export type Role = 'admin' | 'user';

export type User = {
    pseudo: string;
    role: Role;
    id: number;
};

export type Forum = {
    id: number;
    name: string;
    created_at: string;
    subject_count: number;
};

export type Subject = {
    id: number;
    name: string;
    forum_id: number;
    created_at: string;
};

export type FullForum = {
    forum: Forum;
    subjects: Subject[];
};

export type SubjectMessage = {
    id: number;
    text: string;
    user_id: number;
    subject_id: number;
    last_updated: string;
    pseudo: string;
};

export type FullSubject = {
    subject: Subject;
    messages: SubjectMessage[];
};