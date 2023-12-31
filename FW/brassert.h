/*
 * Copyright (c) 1993-1995 Argonaut Technologies Limited. All rights reserved.
 *
 * $Id: brassert.h 1.3 1995/02/22 21:41:23 sam Exp $
 * $Locker:  $
 *
 * Assertion macros
 *
 *	assert() is for internal checks
 *	uassert() is for user checks
 */

/*
 * This file should _NOT_ have checks for single inclusion -
 * it is legitimate to re-include it with DEBUG or PARANOID set diffently
 */
#undef ASSERT

#if DEBUG
#define ASSERT(e) ((void)((e) || (_BrAssert(#e, __FILE__, __LINE__), 1)))
#else
#define ASSERT(ignore) ((void)0)
#endif

#undef UASSERT

#if PARANOID
#define UASSERT(e) ((void)((e) || (_BrUAssert(#e, __FILE__, __LINE__), 1)))
#else
#define UASSERT(ignore) ((void)0)
#endif
